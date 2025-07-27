class UsersController < ApplicationController

  def new
  end

  def index
  end

  def get_profile_image
    @user = current_user
    unless @user.profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      @user.profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    @user.profile_image.variant(resize_to_limit: [100, 100]).processed
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Profile was successfully updated!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Failed to update profile."
      render :edit
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      flash[:notice] = "Account was successfully deleted."
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end
end