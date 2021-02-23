class Product < ApplicationRecord
  belongs_to :user
  has_many :trades
  has_many_attached :photos
end
