class AddActiveTournamentIdToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :active_tournament, foreign_key: { to_table: :tournaments }
  end
end
