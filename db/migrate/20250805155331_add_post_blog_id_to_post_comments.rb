class AddPostBlogIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_comments, :post_blog, null: false, foreign_key: true
  end
end
