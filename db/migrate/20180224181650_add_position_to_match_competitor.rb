class AddPositionToMatchCompetitor < ActiveRecord::Migration[5.1]
  def change
    add_column :match_competitors, :position, :integer
    drop_table :match_results
  end
end
