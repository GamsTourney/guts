class AddHiddenToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :hidden, :boolean
  end
end
