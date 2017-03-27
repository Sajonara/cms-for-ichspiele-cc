class Create < ActiveRecord::Migration[5.0]
  def change
    create_table :google_news_keyword_articles do |t|
      t.integer :google_news_keyword_id
      t.integer :article_id
    end
  end
end
