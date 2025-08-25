class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :post_blog

    validates :user_id, uniqueness: { scope: :post_blog_id }
end
