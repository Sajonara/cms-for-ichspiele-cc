class ArticleGame < ApplicationRecord
  belongs_to :article
  belongs_to :game
end