class RedeemablesController < ApplicationController
  before_action :set_redeemables, only: [:edit, :update, :show, :destroy]
  skip_before_action :verify_authenticity_token, only: :redeem
  require 'rqrcode_png'

  def new
    @redeemables = Redeemable.new

  end

  def show
    @redeemable_is_r = @redeemables.is_redeemed
    if @redeemable_is_r
      redirect_to profile_path, notice: "Redeemed Discount"
    end
      @redeemables_uid = User.find(@redeemables.user_id)
      @redeemables_vid = Vendor.find(@redeemables.vendor_id).name
      @redeemables_did = Discount.find(@redeemables.discount_id).discount
      @redeemables_code = @redeemables.redeem_code
      @qr = RQRCode::QRCode.new(@redeemables_code).to_img.resize(200, 200).to_data_url


  end

  def edit

  end

  def index
    @redeemables = Redeemable.all
  end

  def set_redeemables
    @redeemables = Redeemable.find(params[:id])
  end



  def destroy
    # @redeemables.destroy
    # flash[:notice] = "Redeem Token was deleted"
    # redirect_to vendorportal_path(@discounts.vendor_id)
  end

  def update

  end

  def generate_qr(text)
    require 'barby'
    require 'barby/barcode'
    require 'barby/barcode/qr_code'
    require 'barby/outputter/png_outputter'

    barcode = Barby::QrCode.new(text, level: :q, size: 5)
    base64_output = Base64.encode64(barcode.to_png({ xdim: 5 }))
    "data:image/png;base64,#{base64_output}"
  end

  def redeem
      @code = params[:redeem_code]
      @vendor = Vendor.find(params[:id])
      @redeemables = Redeemable.where(redeem_code: @code, vendor_id: @vendor.id, is_redeemed: false)
      if @redeemables.nil?
        redirect_to portal_path, notice: "Could not find this Discount."
      else
        @redeemables.update(is_redeemed: true)
          redirect_to portal_path, notice: "You Redeemed this Discount"
      end

  end


  def create
    #render plain: params[:article].inspect
    @redeemables = Redeemable.new(redeemable_params)
    @redeemables.save
    if @redeemables.save
      flash[:notice] = "Redeemable Token created"
      redirect_to redeemable_path(@redeemables.id)
    else
      flash[:alert] = "ERROR: Could not create Redeemable Token"
    end

  end



  private
  def redeemable_params
    params.require(:redeem_code)
    params.permit(:user_id, :vendor_id, :discount_id, :redeem_code, :is_redeemed)
  end
end
