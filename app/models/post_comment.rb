class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :post_blog
    
    validates :comment, presence: true, length: { minimum: 1, maximum: 1000 }
end
