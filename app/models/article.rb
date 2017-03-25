class Article < ApplicationRecord
  validates :title, presence: { message: "Du hast vergessen der Nachricht einen Titel zu geben!" },
                    uniqueness: { message: "Dieser Titel wurde bereits einmal genutzt. Denk Dir bitte einen anderen aus. Google mag nämlich keine doppelten Inhalte." }
  
  belongs_to :user
  has_many :article_games
  has_many :games, through: :article_games
end