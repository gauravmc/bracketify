class WelcomeController < ApplicationController
  skip_before_action :ensure_user_login, only: :leaderboard

  def bracket
    @user = current_user
    redirect_to edit_user_path(@user.id) unless @user.bracket.present?
  end

  def current_bracket
    @bracket = User::FINAL_BRACKET
  end

  def leaderboard
    @users = User.where(approved: true, admin: false)
    @users = @users.sort_by(&:points).reverse
  end
end
