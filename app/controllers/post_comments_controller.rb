class PostCommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @post_blog = PostBlog.find(params[:post_blog_id])
        @post_comment = @post_blog.post_comments.build(post_comment_params)
        @post_comment.user = current_user  # Associate the comment with the current user
        # Ensure the post_comment is associated with the post_blog
        @post_comment.save
        redirect_to post_blog_path(@post_blog), notice: "Comment was successfully created."
    end

    def destroy
        @post_comment = PostComment.find(params[:id])

        if @post_comment.user == current_user
            @post_comment.destroy
            redirect_to post_blog_path(@post_comment.post_blog), notice: "Comment was successfully deleted."
        else
            redirect_to post_blog_path(@post_comment.post_blog), alert: "You can only delete your own comments."
        end
    end


    private
    def post_comment_params
        params.require(:post_comment).permit(:comment)
    end

end
