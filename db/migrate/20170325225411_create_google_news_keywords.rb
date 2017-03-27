class CreateGoogleNewsKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :google_news_keywords do |t|
      t.string :news_keyword, limit: 40
    end
  end
end
