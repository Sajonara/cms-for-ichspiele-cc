# == Schema Information
#
# Table name: google_news_keyword_articles
#
#  id                     :integer          not null, primary key
#  google_news_keyword_id :integer
#  article_id             :integer
#

class GoogleNewsKeywordArticle < ApplicationRecord
  belongs_to :google_news_keyword
  belongs_to :article
end
