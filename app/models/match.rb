class Match < ApplicationRecord
  has_many :match_competitors
  has_many :competitors, through: :match_competitors
  belongs_to :game

  def players
    competitors.collect(&:player)
  end

  def results
    result_list = []
    match_results.each do |match_result|
      result = {
        player_id: match_result.player.id,
        position: match_result.position,
        points: match_result.points
      }
      result_list << result
    end
    result_list
  end

  def scores
    game.scores
  end
end
