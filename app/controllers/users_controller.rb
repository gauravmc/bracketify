class UsersController < ApplicationController
  def edit
    @group_stage = current_user.bracket[0]
    @final_16 = current_user.bracket[1]
    @quarter_finals = current_user.bracket[2]
    @semi_finals = current_user.bracket[3]
    @finals = current_user.bracket[4]
    @winner = current_user.bracket[5]
  end

  def update
    redirect_to edit_user_path(current_user), flash: {notice: 'Bracket was updated!'}
  end
end
