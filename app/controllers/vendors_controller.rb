class VendorsController < ApplicationController

  before_action :set_vendor, only: [:edit, :update, :show, :destroy]



  def new
    @vendors = Vendor.new
  end

  def show

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
      redirect_to vendor_path(@vendors)
    else
      flash[:notice] = "Vendor was not updated"
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect

    @vendors = Vendor.new(vendor_params)
    @vendors.user_id = current_user.id
    @vendors.save
    if @vendors.save
      flash[:notice] = "Vendor was successfully created"
      redirect_to profile_path
    else
      flash[:notice] = "ERROR: Could not create vendor"
      redirect_to profile_path
    end

  end

  private
  def vendor_params
    params.require(:vendor).permit(:name, :address,:description,:phone_number,:email)
  end
end