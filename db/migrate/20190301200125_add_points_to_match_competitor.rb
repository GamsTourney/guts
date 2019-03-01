class AddPointsToMatchCompetitor < ActiveRecord::Migration[5.1]

  def up
    add_column :match_competitors, :points, :integer, default: 0
    MatchCompetitor.all.each do |mc|
      if mc.position
        mc.points = mc.match.scores.where(position: mc.position).first.value
        mc.save
      end
    end
  end

  def down
    remove_column :match_competitors, :points, :integer
  end

end
