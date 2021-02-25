class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :product

  after_update :update_rating

  validates :content, presence: true, length: { minimum: 5 }

  def update_rating
    new_rating = product.user.trades.reduce(0.0) { |total, trade| trade.review_rating + total } / product.user.trades.count
    product.user.update_attribute(:rating, new_rating.round(1))
  end
end
