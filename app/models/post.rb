class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 500 }
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :graphs, dependent: :destroy
  has_many :hashtag_maps, dependent: :destroy
  has_many :hashtags, through: :hashtag_maps
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :graphs, allow_destroy: true

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end

  def save_tag(sent_tags)
    current_tags = hashtags.pluck(:hashname) unless hashtags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      hashtags.destroy Hashtag.find_by(hashname: old)
    end

    new_tags.each do |new|
      new_post_tag = Hashtag.find_or_create_by(hashname: new)
      hashtags << new_post_tag
    end
  end
end
