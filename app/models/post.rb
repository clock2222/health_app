class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :category
  has_many :ingredients, dependent: :destroy
  has_many :how_to_makes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :graphs, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :how_to_makes, :graphs, allow_destroy: true

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
