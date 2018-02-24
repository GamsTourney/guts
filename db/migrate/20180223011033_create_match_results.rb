class CreateMatchResults < ActiveRecord::Migration[5.1]
  def change
    create_table :match_results do |t|
      t.integer :match_competitor_id
      t.integer :position

      t.timestamps
    end
  end
end
