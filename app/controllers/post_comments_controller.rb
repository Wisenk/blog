class PostCommentsController < ApplicationController

    def create
        @post_blog = PostBlog.find(params[:post_blog_id])
        @post_comment = current_user.post_comments.new(post_comment_params)
        @post_comment.post_blog.id = @post_blog.id
        # Ensure the post_comment is associated with the post_blog
        @post_comment.save
        redirect_to post_blog_path(@post_blog), notice: "Comment was successfully created."
    end


    private
    def post_comment_params
        params.require(:post_comment).permit(:content)
    end

end
