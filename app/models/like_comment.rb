class LikeComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment, counter_cache: :likes_count

  validates :user_id, uniqueness: {
    scope: :comment_id,
    message: "は同じ投稿に２回以上いいねはできません"
  }
end
