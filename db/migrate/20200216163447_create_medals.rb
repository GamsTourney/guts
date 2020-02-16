class CreateMedals < ActiveRecord::Migration[5.2]
  def change
    create_table :medals do |t|
      t.belongs_to :player, foreign_key: true
      t.string :name
      t.integer :variant

      t.timestamps
    end
  end
end
