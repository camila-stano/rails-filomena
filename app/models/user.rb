class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :trades
  has_many :product_removes
  has_one_attached :photo

  GENDER = ['Mulher', 'Homem', 'Prefiro não me identificar']
  
  validates :first_name, presence: true
end
