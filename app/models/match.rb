class Match < ApplicationRecord
  has_many :match_competitors
  has_many :competitors, through: :match_competitors
  belongs_to :game
  belongs_to :tournament

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

  def completed?
    match_competitors.any? { |mc| mc.position }
  end

  def scores
    game.scores
  end

  # Update results for the match competitors. Expects a list of player ids
  # This can probably be cleaned up with a more direct query for match_competitors
  def submit_results(players)
    competitor_map = competitors.index_by(&:player_id)
    match_competitor_map = match_competitors.index_by(&:competitor_id)
    Match.transaction do
      players.each_with_index  do |player, idx|
        competitor = competitor_map[player]
        match_competitor = match_competitor_map[competitor.id]
        match_competitor.position = idx
        match_competitor.save
      end
    end
  end
end
