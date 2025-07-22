class UsersController < ApplicationController

  def new
  end

  def index
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
      flash[:notice] = "Profile was successfully updated."
      redirect_to user_path(@user)
    else
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