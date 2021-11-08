class Ingredient < ApplicationRecord
  belongs_to :post
  validates :ing_name, presence: true
  validates :quantity, presence: true
end
