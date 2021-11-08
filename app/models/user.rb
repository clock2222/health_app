class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_one :status, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :like_comments, dependent: :destroy
  has_many :liked_comments, through: :like_comments, source: :comment
  accepts_nested_attributes_for :status, allow_destroy: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲストユーザー"
    end
  end
end
