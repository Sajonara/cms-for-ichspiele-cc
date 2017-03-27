class GoogleNewsKeywordArticle < ApplicationRecord
  belongs_to :google_news_keyword
  belongs_to :article
end