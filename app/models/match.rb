class Match < ApplicationRecord
  has_many :match_competitors
  has_many :competitors, through: :match_competitors
  belongs_to :game

  def players
    competitors.collect(&:player)
  end

  def results
    result_list = []
    match_competitors.each do |match_competitor|
      result = {
        player_id: match_competitor.player.id,
        position: match_competitor.position,
        points: match_competitor.points
      }
      result_list << result
    end
    result_list
  end

  def scores
    game.scores
  end

  # Update results for the match competitors. Expects a list of ids
  def submit_results(competitor_ids)
    Match.transaction do
      competitor_ids.each_with_index  do |competitor, idx|
        match_competitor = match_competitors.find(competitor)
        match_competitor.update(position: idx)
      end
    end
  end
end
