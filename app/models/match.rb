class Match < ApplicationRecord
  has_many :match_competitors
  has_many :competitors, through: :match_competitors
  belongs_to :game
  belongs_to :tournament

  def players
    competitors.collect(&:player)
  end

  def completed?
    match_competitors.any? { |mc| mc.points && mc.points > 0 }
  end

  def submit_results(scores)
    Match.transaction do
      scores.each do |score|
        mc = MatchCompetitor.find(score['match_competitor_id'])
        mc.position = score['position']
        mc.points = score['points']
        mc.save
      end
    end
  end
end
