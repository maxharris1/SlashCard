class VendorsController < ApplicationController

  before_action :set_vendor, only: [:edit, :update, :show,:vendorportal,:redeem_discount, :pendingdiscounts,:destroy]
  before_action :authenticate_user!, only: :vendorportal



  def new
    @vendors = Vendor.new

  end

  def show
    @vendor_discounts = @vendors.discounts
    @vendors_id = @vendors.user_id
    @vendors_sid = @vendors.school_id
    @vendor_reviews = Review.where(vendor_id: params[:id])
    puts @vendor_reviews
  end


  def vendorportal
    @vendors = Vendor.find(params[:id])
    if is_owner?(@vendors)
      @vendor_discounts = @vendors.discounts
      @vendor_reviews = Review.where(vendor_id: params[:id])
      @vendors = Vendor.find(params[:id])
      @discounts = Discount.new(vendor_id: params[:vendor_id])
      @active_redeemables = Redeemable.where(vendor_id: params[:id], is_redeemed: false)
      @active_exclrewards = Exclreward.where(vendor_id: params[:id], is_redeemed: false)
      @vendor_discounts = @vendors.discounts
      @vendors = Vendor.find(params[:id])
      @past_redeemables = Redeemable.where(vendor_id: params[:id], is_redeemed: true)
      @past_exclrewards = Exclreward.where(vendor_id: params[:id], is_redeemed: true)
    else
      flash[:alert] = "Error: Must Be An Owner Of " + @vendors.name + " In Order To View This Page"
      redirect_to root_path
    end

  end

  def scan

  end

  def edit

  end

  def profile
    @vendors = Vendor.all
  end

  def index
    @vendors = Vendor.all
  end

  def set_vendor
    @vendors = Vendor.find(params[:id])
  end

  def destroy
    @vendors.destroy
    flash[:notice] = "Vendor was deleted"
    redirect_to profile_path
  end

  def update
    if @vendors.update(vendor_params)
      flash[:notice] = "Vendor was updated"
      redirect_to profile_path
    else
      flash[:alert] = "Vendor was not updated"
      render 'edit'
    end
  end

  def create

    @vendors = Vendor.new(vendor_params)
    @vendors.school_id = current_user.school_id
    @vendors.user_id = current_user.id
    @vendors.save
    if @vendors.save
      flash[:notice] = "Vendor was successfully created"
      redirect_to profile_path
    else
      flash[:alert] = "ERROR: Could not create vendor"
      redirect_to profile_path
    end

  end

  private
  def vendor_params
    params.require(:vendor).permit(:name, :address,:description,:phone_number,:email,:logo)
  end


  def sortable_columns
    ["Redeemed at:"]
  end

  def is_owner?(vendor)
    current_user.vendors.where(id: vendor.id).any?
  end

end