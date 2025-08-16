class Public::UsersController < ApplicationController
before_action :authenticate_user!

  def new
  end

  def index
    @user = User.find(params[:id])
    @post_blogs = @user.post_blogs
  end

  def show
    @user = User.find(params[:id])
    @post_blogs = @user.post_blogs
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
    params.require(:user).permit(:name, :body, :profile_image)
  end
end