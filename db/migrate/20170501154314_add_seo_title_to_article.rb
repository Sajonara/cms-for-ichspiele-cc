class AddSeoTitleToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :seo_title, :string
    add_column :articles, :seo_description, :text
  end
end
