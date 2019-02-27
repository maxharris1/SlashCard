class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :all

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      super
    elsif resource.is_a?(Manager)
        portal_path
    else
      super
    end
  end

  def get_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '65.254.109.37'
    else
      request.remote_ip
    end
  end


end



