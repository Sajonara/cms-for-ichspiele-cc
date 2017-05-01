# == Schema Information
#
# Table name: articles
#
#  id              :integer          not null, primary key
#  title           :string
#  content         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  seo_title       :string
#  seo_description :text
#

class Article < ApplicationRecord
  validates :title, presence: { message: "Du hast vergessen der Nachricht einen Titel zu geben!" },
                    uniqueness: { message: "Dieser Titel wurde bereits einmal genutzt. Denk Dir bitte einen anderen aus. Google mag nämlich keine doppelten Inhalte." }
  validates :seo_title, uniqueness: { message: "Du hast diesen SEO-Titel bereits einmal verwendet. Denk Dir bitte einen anderen aus. Für das Ranking bei Google ist das ansonsten nicht hilfreich."}

  belongs_to :user
  has_many :article_games
  has_many :games, through: :article_games
  has_many :google_news_keyword_articles
  has_many :google_news_keywords, through: :google_news_keyword_articles
  accepts_nested_attributes_for :google_news_keyword_articles
end
