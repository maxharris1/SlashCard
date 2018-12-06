class UsersController < ApplicationController
  def profile
    @user = current_user
    @user_vendors = @user.vendors
  end

end
