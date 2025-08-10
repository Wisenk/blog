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
   if profile_image.attached?
      profile_image.variant(resize_to_limit: [150, 150])
    else
      "app/assets/images/no_image.jpg"
    end
  end
end
