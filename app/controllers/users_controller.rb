class UsersController < ApplicationController
  before_action :ensure_user_is_admin, only: [:index, :approve]
  skip_before_action :ensure_user_login, only: :bracket

  def index
    @users = User.all
  end

  def edit
    redirect_to bracket_path, flash: {error: "Cannot reupload the bracket once it has been approved. Contact the admin if there's a problem with your bracket."} if current_user.approved?
  end

  def upload_bracket
    uploaded_io = params[:bracket]

    if uploaded_io.present? && uploaded_io.is_a?(ActionDispatch::Http::UploadedFile)
      File.open(Rails.root.join('public', 'uploads', "#{current_user.email.parameterize}.csv"), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      current_user.save_bracket

      redirect_to bracket_path, flash: { success: "Your bracket predictions have been added successfully." }
    else
      redirect_to edit_user_path(current_user), flash: { error: "No .csv file found. Please try again." }
    end
  end

  def approve
    user = User.find params[:id]
    user.approved = true
    user.save

    redirect_to users_path, flash: {success: "Users #{user.name}'s bracket has been approved."}
  end

  def bracket
    @user = User.find params[:id]
  end
end
