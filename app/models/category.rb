class Category < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_ancestry
end
