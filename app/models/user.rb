class User < ApplicationRecord
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, confirmation: true, format: { with: VALID_EMAIL_REGEX }
  
  has_many :games
  has_many :news
end