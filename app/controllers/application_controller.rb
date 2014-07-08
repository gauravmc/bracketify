class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :ensure_user_login

  def ensure_user_login
    redirect_to '/auth/google_oauth2' unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_user_is_admin
    redirect_to(root_path, flash: {notice: "You're not an administrator."}) unless current_user.admin?
  end
end
