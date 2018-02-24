class MatchResult < ApplicationRecord
  belongs_to :match_competitor

  def player
    match_competitor.competitor.player
  end

  def scores
    match_competitor.match.game.scores
  end

  def points
    scores.where(position: position).first.value
  end
end
