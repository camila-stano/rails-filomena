class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :content, presence: true, length: { minimum: 5 }
end
