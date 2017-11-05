class RemoveTournamentIdFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :tournament_id, :integer
  end
end
