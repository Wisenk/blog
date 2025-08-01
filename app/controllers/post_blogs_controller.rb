class PostBlogsController < ApplicationController
  before_action :set_post_blog, only: [:edit, :update, :destroy, :show]

  def new
    @post_blog = PostBlog.new
  end

  def create
    #
    @post_blog = PostBlog.new(post_blog_params)
    @post_blog.user = current_user
        
    if @post_blog.save
      flash[:notice] = "Post was successfully created!"
      redirect_to post_blog_path(@post_blog) 
    else
      flash.now[:alert] = "Failed to create post. Please try again."
      render :new
    #
    end
  end

  def edit
  end

  def show
    @post_blog = PostBlog.find(params[:id])
  end

  def view
  end

  def update
    if @post_blog.update(post_blog_params)
      flash[:notice] = "Post was successfully updated!"
      redirect_to post_blog_path(@post_blog)
    else
      flash.now[:alert] = "Failed to update post. Please try again."
      render :edit
    end
  end

  def destroy
    @post_blog = PostBlog.find(params[:id])
    if @post_blog.destroy
      flash[:notice] = "Post was successfully deleted."
      redirect_to post_blogs_path
    else
      flash.now[:alert] = "Failed to delete post. Please try again."
      redirect_to post_blog_path(@post_blog)
    end
  end

  def index
    @post_blogs = PostBlog.all
  end

  def myposts
    @post_blogs = current_user.post_blogs
    if @post_blogs.empty? 
      flash.now[:alert] = "You have no posts yet. Create one to share your thoughts!" 
    end
  end

  # def search
    # @post_blogs = PostBlog.where("title LIKE ?", "%#{params[:query]}%")
    # if @post_blogs.empty?
    #  flash.now[:alert] = "No posts found matching your search criteria."
    #  @post_blogs = PostBlog.all
    # else
    #  flash.now[:notice] = "#{@post_blogs.count} posts found."
    # end
    # render :index
  # end 



  private

  def post_blog_params
    params.require(:post_blog).permit(:title, :body, :image)
  end

  def set_post_blog
    @post_blog = PostBlog.find(params[:id])
    unless @post_blog.user == current_user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to post_blogs_path
    end
  end
end


