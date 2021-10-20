class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 99 }
  has_many :hashtag_maps
  has_many :posts, through: :hashtag_maps
end
