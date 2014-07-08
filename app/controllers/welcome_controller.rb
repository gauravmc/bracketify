class WelcomeController < ApplicationController
  def bracket
    @user = current_user
    redirect_to edit_user_path(@user.id) unless @user.bracket.present?
  end

  def leaderboard
    @users = User.where(approved: true, admin: false)
    @users = @users.sort_by(&:points).reverse
  end
end
