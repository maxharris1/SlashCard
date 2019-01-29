class DiscountsController < ApplicationController

  before_action :set_discounts, only: [:edit, :update, :show, :destroy]



  def new
    @discounts = Discount.new
  end

  def show
    @discounts_vid = Discount.find(params[:vendor_id])
  end

  def edit

  end

  def index
    @discounts = Discount.all
  end

  def set_discounts
    @discounts = Discount.find(params[:id])
  end

  def destroy
    @discounts.destroy
    flash[:notice] = "Discount was deleted"
    redirect_to vendorportal_path(@discounts.vendor_id)
  end

  def update
    if @discounts.update(discount_params)
      flash[:notice] = "Discount was updated"
      redirect_to vendorportal_path(@discounts.vendor_id)
    else
      flash[:alert] = "Discount was not updated"
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect
    @discounts = Discount.new(discount_params)
    @discounts.save
    if @discounts.save
      flash[:notice] = "Discount was successfully created"
      redirect_to vendorportal_path(@discounts.vendor_id)
    else
      flash[:alert] = "ERROR: Could not create discount"
      render 'new'
    end

  end



  private
  def discount_params
    params.require(:discount).permit(:discount, :vendor_id)
  end
end