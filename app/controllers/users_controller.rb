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


    @common_redeems = Redeemable.select(:discount_id).group(:discount_id).having("count(*) > 5").all

    common_discounts = []
    @common_redeems.each do |v|
        common_discounts.push(v.discount_id)
    end
    @common_discounts = common_discounts
    @user_favorites = current_user.favorites
    # if @user_favorites.any?
    #   render "updateFavorites.js.erb"
    # end


  end

  def updateFavorites
    @user_favorites = current_user.favorites
    respond_to do |format|
      format.js
      format.html
    end

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
