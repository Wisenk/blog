class Public::FavoritesController < ApplicationController
    before_action :authenticate_user!

    def create
        post_blog = PostBlog.find(params[:post_blog_id])
        favorite = current_user.favorites.new(post_blog_id: post_blog.id)
        favorite.save
        redirect_to post_blog_path(post_blog)
    end

    def destroy
        post_blog = PostBlog.find(params[:post_blog_id])
        favorite = current_user.favorites.find_by(post_blog_id: post_blog.id)
        favorite.destroy
        redirect_to post_blog_path(post_blog)
    end
end
