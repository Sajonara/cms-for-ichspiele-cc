# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  name            :string
#  release_germany :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  usk             :integer
#  user_id         :integer
#

class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :usk, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 99 }
  
  belongs_to :user
  has_many :article_games
  has_many :articles, through: :article_games
end
