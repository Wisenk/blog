class PostBlogsController < ApplicationController
  def new
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
end
