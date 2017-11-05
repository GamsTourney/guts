class RenameParticipationsToCompetitors < ActiveRecord::Migration[5.1]
  def change
    rename_table :competitors, :competitors
  end
end
