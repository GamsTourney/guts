class AddUniqueIndexToScore < ActiveRecord::Migration[5.1]
  def change
    add_index :scores, [:game_id, :position], unique: true
  end
end
