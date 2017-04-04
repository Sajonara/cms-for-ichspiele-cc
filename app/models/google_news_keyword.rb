# == Schema Information
#
# Table name: google_news_keywords
#
#  id           :integer          not null, primary key
#  news_keyword :string(40)
#

class GoogleNewsKeyword < ApplicationRecord
  validates :news_keyword, uniqueness: true
  
  has_many :google_news_keyword_articles
  has_many :articles, through: :google_news_keyword_articles
end
