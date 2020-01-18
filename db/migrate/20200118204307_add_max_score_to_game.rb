class AddMaxScoreToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :max_score, :integer
  end
end
