class PostBlog < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :body, presence: true, length: { minimum: 5, maximum: 1000 }
  validates :image, content_type: [:png, :jpg, :jpeg], size: { less_than: 5.megabytes }

end
