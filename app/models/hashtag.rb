class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 35 }
  has_many :hashtag_maps, dependent: :destroy
  has_many :posts, through: :hashtag_maps
end
