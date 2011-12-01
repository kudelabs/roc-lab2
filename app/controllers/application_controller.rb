class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_logged_in
  helper_method :current_user, :logged_in?
  
  def current_user
    return nil unless session[:user_id]
    @user ||= User.find(session[:user_id])    
  end
  
  def logged_in?
    current_user
  end
  
  def require_logged_in
    return true if logged_in?    
    redirect_to new_session_path
  end
end
