class CreatePostBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :post_blogs do |t|
      t.string :title
      t.text :body
      t.integer :user_id, null: false
      
      t.timestamps
    end
  end
end
