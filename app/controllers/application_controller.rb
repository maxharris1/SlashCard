class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '65.254.109.37'
    else
      request.remote_ip
    end
  end
end


