class MakePlayersAuthable < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :email, :string
    add_column :players, :admin, :boolean
    add_column :players, :password_digest, :string
  end
end
