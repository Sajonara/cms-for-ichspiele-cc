class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :usk, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 99 }
end