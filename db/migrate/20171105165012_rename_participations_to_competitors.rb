class RenameParticipationsToCompetitors < ActiveRecord::Migration[5.1]
  def change
    rename_table :participations, :competitors
  end
end
