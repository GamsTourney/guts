class AddDetailsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :details, :string
  end
end
