class UsersController < ApplicationController



  def profile
    @user = current_user
    @user_vendors = @user.vendors
    @user_school = School.find(@user.school_id)
    @user_is_vendor_owner = @user.has_Business
    @user_redeemables = Redeemable.where(user_id: current_user.id, is_redeemed: true)
    @user_pending = Redeemable.where(user_id: current_user.id, is_redeemed: false)
    @user_exclrewards = Exclreward.where(user_id: current_user.id, is_redeemed: true)
    @user_exclrewards_p = Exclreward.where(user_id: current_user.id, is_redeemed: false)
  end

  def redeem
    if session[:lat].nil? && session[:lng].nil?
      @uLat = current_user.school.latitude
      @uLng = current_user.school.longitude

    else
      @uLat = session[:lat]
      @uLng = session[:lng]
    end
    @vendor_list = Vendor.all
    @nearest_vendor = Vendor.all.near([@uLat,@uLng], 1, order: 'distance').first
  end

  def redeem_discount
    @vendor_discounts = Vendor.find(params[:id]).discounts
    @vendor = Vendor.find(params[:id])
    @user = current_user
  end

  def redeem_exclr
    @vendor_discounts = Vendor.find(params[:id]).discounts
    @vendor = Vendor.find(params[:id])
    @user = current_user
  end

  def sortable_columns
    ["Redeemed at:"]
  end


end
