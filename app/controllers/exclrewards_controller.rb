class ExclrewardsController < ApplicationController

  before_action :set_exclr, only: [:edit, :update, :show, :destroy]
  skip_before_action :verify_authenticity_token, only: :redeem
  require 'rqrcode_png'


  def new
    @exclrewards = Exclreward.new
  end

  def show
    @exclrewards_is_r = @exclrewards.is_redeemed
    if @exclrewards_is_r
      redirect_to profile_path, notice: "Redeemed Exclusive Reward"
    end
    @exclr_uid = User.find(@exclrewards.user_id)
    @exclr_vid = Vendor.find(@exclrewards.vendor_id).name
    @exclr_code = @exclrewards.redeem_code
    @exclr_descr = @exclrewards.description
    @qr = RQRCode::QRCode.new(@exclr_code).to_img.resize(200, 200).to_data_url


  end

  def edit

  end

  def index
    @exclrewards = Exclreward.all

  end

  def set_exclr
    @exclrewards = Exclreward.find(params[:id])
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
    @exlcr = Exclreward.where(redeem_code: @code, vendor_id: @vendor.id, is_redeemed: false)
    if @exlcr.nil?
      redirect_to vendorportal_path(@vendor.id), notice: "Could not find this Exclusive Reward."
    else
      @exlcr.update(is_redeemed: true)
      redirect_to vendorportal_path(@vendor.id), notice: "You Redeemed this Exclusive Reward"
    end
  end

  def create
    #render plain: params[:article].inspect
    @exclrewards = Exclreward.new(exclr_params)
    @exclrewards.save
    if @exclrewards.save
      flash[:notice] = "Redeemable Token created"
      if manager_signed_in?
        redirect_to portal_path
      else
        redirect_to vendorportal_path(@exclrewards.vendor_id)
      end

    else
      flash[:alert] = "ERROR: Could not create Redeemable Token"
      render "new"
    end

  end





  private
  def exclr_params
    params.require(:exclreward).permit(:user_id, :vendor_id, :redeem_code,:description,:manager_id, :is_redeemed)
  end

end