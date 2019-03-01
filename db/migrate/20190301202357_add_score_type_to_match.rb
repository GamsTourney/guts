class AddScoreTypeToMatch < ActiveRecord::Migration[5.1]
  def up
    add_column :matches, :score_type, :string
    Tournament.find_by(name: 'Gams 2018').matches.all.each do |m|
      m.score_type = 'rank'
      m.save
    end
  end

  def down
    remove_column :matches, :score_type, :string
  end
end
