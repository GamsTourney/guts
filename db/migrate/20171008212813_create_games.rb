class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :img_url
      t.string :scoring
      t.integer :tournament_id

      t.timestamps
    end
  end
end
