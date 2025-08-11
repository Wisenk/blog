class Admin::PostBlogsController < ApplicationController
    before_action :authenticate_admin!
    
    def index
      @post_blogs = PostBlog.order(created_at: :desc)
    end
  
    def destroy
      @post_blog = PostBlog.find(params[:id])
      @post_blog.destroy
      redirect_to admin_post_blogs_path, notice: "Post deleted."
    end
  end
  