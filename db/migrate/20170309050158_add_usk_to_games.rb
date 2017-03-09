class AddUskToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :usk, :integer
  end
end
