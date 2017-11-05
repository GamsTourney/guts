class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :game_id
      t.date :start_time

      t.timestamps
    end
  end
end
