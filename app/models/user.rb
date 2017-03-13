class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, confirmation: true
  
  has_many :games
  has_many :news
end