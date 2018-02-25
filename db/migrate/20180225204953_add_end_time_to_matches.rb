class AddEndTimeToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :end_time, :date
  end
end
