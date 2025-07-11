class PostBlogsController < ApplicationController

  def new
    @post_blog = PostBlog.new
  end

  def create
    #
    @post_blog = PostBlog.new(post_blog_params)
    @post_blog.user = current_user.id
    @post_blog.image.attach(params[:post_blog][:image]) if params[:post_blog][:image].present?
    if @post_blog.save
      flash[:notice] = "Post was successfully created."
      redirect_to post_blog_path(@post_blog) 
    else
      flash.now[:alert] = "Failed to create post. Please check the errors."
      render :new
    #
    end
  end

  def edit
  end

  def show
  end

  def view
  end

  def index
    @post_blogs = PostBlog.all
  end

  def search
    @post_blogs = PostBlog.where("title LIKE ?", "%#{params[:query]}%")
    if @post_blogs.empty?
      flash.now[:alert] = "No posts found matching your search criteria."
      @post_blogs = PostBlog.all
    else
      flash.now[:notice] = "#{@post_blogs.count} posts found."
    end
    render :index
  end


  private

  def post_blog_params
    params.require(:post_blog).permit(:title, :body, :image)
  end
end
