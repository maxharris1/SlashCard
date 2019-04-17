class Discounts::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discount

  def create
    @discount.favorites.where(user_id: current_user.id, vendor_id: @discount.vendor_id).first_or_create

    respond_to do |format|
      format.html { redirect_to @discount }
      format.js
    end
  end

  def destroy
    @discount.favorites.where(user_id: current_user.id, vendor_id: @discount.vendor_id).destroy_all

    respond_to do |format|
      format.html { redirect_to @discount }
      format.js
    end

    if current_page?(profile_path)
      puts "yes"
      render "users/updateFavorites.js.erb"
    end
  end

  private

  def set_discount
    @discount = Discount.find(params[:discount_id])
  end
end