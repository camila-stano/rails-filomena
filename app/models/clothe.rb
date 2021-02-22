class Clothe < ApplicationRecord
  belongs_to :user
  has_many :trades
end
