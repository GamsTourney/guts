class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.integer :player_id
      t.integer :tournament_id
    end
  end
end
