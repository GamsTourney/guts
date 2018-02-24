class MatchResult < ApplicationRecord
  belongs_to :match_competitor

  def scores
    match_competitor.match.game.scores
  end

  def points
    scores.where(position: position).first.value
  end
end
