class CreateArticleGames < ActiveRecord::Migration[5.0]
  def change
    create_table :article_games do |t|
      t.integer :article_id
      t.integer :game_id
    end
  end
end
