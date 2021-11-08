class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :like_comments, dependent: :destroy
  has_many :liked_users, through: :like_comments, source: :user

  def liked_by?(user)
    like_comments.any? { |like| like.user_id == user.id }
  end
end
