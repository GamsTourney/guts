class RemoveScoringFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :scoring
  end
end
