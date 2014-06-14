class WelcomeController < ApplicationController
  skip_before_action :ensure_user_login

  def bracket
    @user = User.find params[:user_id]
  end

  def leaderboard
  end
end
