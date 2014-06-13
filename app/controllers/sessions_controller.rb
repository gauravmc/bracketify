class SessionsController < ApplicationController
  skip_before_action :ensure_user_login

  def create
    oauth_response = env["omniauth.auth"]

    if shopify_account?(oauth_response)
      user = User.from_omniauth(oauth_response)
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_failure_path, flash: { error: "Must login with a Shopify google account." }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def failure
  end

  private

  def shopify_account?(oauth_response)
    email = oauth_response.info.email
    domain = email[/.+@(.+)/, 1]
    %w(jadedpixel.com shopify.com).include?(domain)
  end
end
