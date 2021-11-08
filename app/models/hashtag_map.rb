class HashtagMap < ApplicationRecord
  belongs_to :post
  belongs_to :hashtag, dependent: :destroy
  with_options presence: true do
    validates :post_id
    validates :hashtag_id
  end
end
