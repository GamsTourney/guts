class Match < ApplicationRecord
  has_many :match_competitors
  has_many :competitors, through: :match_competitors
  belongs_to :game
  belongs_to :tournament

  def players
    competitors.collect(&:player)
  end

  def group_id
    groups = Match.where(tournament: tournament, game: game, start_time: start_time)
    if groups.length > 1
      return groups.pluck(:id).index(id)
    end
  end

  # Do we need this anymore since its just mc data now?
  def results
    result_list = []
    match_competitors.each do |match_competitor|
      result = {
        player_id: match_competitor.player_id,
        position: match_competitor.position,
        points: match_competitor.points
      }
      result_list << result
    end
    result_list
  end

  def completed?
    match_competitors.any? { |mc| mc.points && mc.points > 0 }
  end

  def scores
    game.scores
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
