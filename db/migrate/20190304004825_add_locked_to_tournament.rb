class AddLockedToTournament < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :locked, :boolean, default: false
  end
end
