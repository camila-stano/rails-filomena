class Product < ApplicationRecord
  belongs_to :user
  has_many :trades
  has_many_attached :photos

  CATEGORIES = %w[Casual Festa Rolê]
  PRODUCT_TYPE = %w[Shorts Camiseta Vestido]
  SIZE = %w[PP P M G GG XGG 38 40 42 44 46 48 50 52 54 56 58 60]
end
