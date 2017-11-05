class AddTimestampsToCompetitors < ActiveRecord::Migration[5.1]
  def change
    add_column :competitors, :created_at, :datetime, null: false, default: Time.now
    add_column :competitors, :updated_at, :datetime, null: false, default: Time.now
  end
end
