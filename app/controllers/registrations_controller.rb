class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit( :first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :has_Business,
                                  :redeem_code,
                                  :avatar,
                                  :school_id)
  end

  def account_update_params
    params.require(:user).permit( :first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :current_password,
                                  :avatar,
                                  :school_id)
  end



  def new

  end
end