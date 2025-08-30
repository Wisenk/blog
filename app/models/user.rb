class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :post_blogs, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image
  has_many :favorites, dependent: :destroy
  
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true, uniqueness: true

  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    profile_image #.variant(resize_to_limit: [150, 150])
  end

  def follow(user)
    active_relationships.find_or_create_by(followed_id: user.id) 
  end

  def unfollow(user)
    relationship = active_relationships.find_by(followed_id: user.id)&.destroy
  end

  def following?(user)
    following.include?(user)
  end
    
end
