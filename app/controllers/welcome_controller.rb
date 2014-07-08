class WelcomeController < ApplicationController
  def bracket
    @user = User.find params[:user_id]
  end

  def leaderboard
    @users = User.where(approved: true)
    @users = @users.sort_by(&:points).reverse
  end
end
