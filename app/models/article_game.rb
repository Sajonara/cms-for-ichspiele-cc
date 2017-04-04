# == Schema Information
#
# Table name: article_games
#
#  id         :integer          not null, primary key
#  article_id :integer
#  game_id    :integer
#

class ArticleGame < ApplicationRecord
  belongs_to :article
  belongs_to :game
end
