class AddTeamMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :match_competitors, :team, :integer
  end
end
