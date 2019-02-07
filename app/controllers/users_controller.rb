class UsersController < ApplicationController



  def profile
    @user_ip = get_ip()
    @user_loc = Geocoder.coordinates(@user_ip)
    @user = current_user
    @user_vendors = @user.vendors
    @user_is_vendor_owner = @user.has_Business
  end

end
