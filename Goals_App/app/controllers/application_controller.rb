class ApplicationController < ActionController::Base
  helper_method :current_user 

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user 
    @current_user ||= User.find_by(session_token: session[:session_token])
  end 

  def logged_in?
    !!(current_user)
  end 

  def require_logout
    redirect_to users_url if logged_in?
  end

  def logout
    session[:session_token] = nil 

    if current_user
      current_user.reset_session_token!
    else 
      @current_user = nil 
    end 
  end 
end
