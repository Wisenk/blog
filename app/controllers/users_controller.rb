class UsersController < ApplicationController
  def new
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @post_blogs = @user.post_blogs
  end

  def edit
  end
end
