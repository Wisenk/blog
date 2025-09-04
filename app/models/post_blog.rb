class PostBlog < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_rich_text :body

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg, image/png, image/jpg, image/webp')
    end
    image.variant(resize_to_limit: [500, 500]).processed
  end

  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :body, presence: true, length: { minimum: 2 }
  validates :image, content_type: [:png, :jpg, :jpeg, :webp], size: { less_than: 5.megabytes }


  def self.search(keyword)
    if keyword.present?
      PostBlog.where('LOWER(title) LIKE ?', "%#{keyword.downcase}%")
    else
      PostBlog.all
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end