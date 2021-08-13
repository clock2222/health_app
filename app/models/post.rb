class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  mount_uploader :image, ImageUploader

  has_many :ingredients, dependent: :destroy
  has_many :how_to_makes, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :how_to_makes, allow_destroy: true
end
