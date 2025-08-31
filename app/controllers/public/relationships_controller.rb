class Public::RelationshipsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      user = User.find(params[:user_id])
      current_user.follow(user)
      redirect_to user_path(user), notice: "You are now following '#{user.name}'"
    end
  
    def destroy
      user = Relationship.find(params[:id]).followed
      current_user.unfollow(user)
      redirect_to user_path(user), notice: "You unfollowed '#{user.name}'"
    end
  end
  