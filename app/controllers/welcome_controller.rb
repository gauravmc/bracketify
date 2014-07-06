class WelcomeController < ApplicationController
  def bracket
    @user = User.find params[:user_id]
  end

  def leaderboard
  end
end
