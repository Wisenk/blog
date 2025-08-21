class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :post_blogs, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true, uniqueness: true

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-profile.jpg', content_type: 'image/jpeg, image/png, image/jpg')
    end
    profile_image.variant(resize_to_limit: [150, 150])
  end
end
