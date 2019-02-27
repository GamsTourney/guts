class MatchCompetitor < ApplicationRecord
  belongs_to :match
  belongs_to :competitor

  def player
    competitor.player
  end

  # TODO: Optimize
  def player_id
    competitor.player.id
  end

  def game
    match.game
  end

  def points
    points = 0
    if position
      points = match.scores.where(position: position).first.value
    end
    points
  end
end
