class MatchCompetitor < ApplicationRecord
  @@player_cache = {}
  belongs_to :match
  belongs_to :competitor

  def player
    @@player_cache[competitor_id] ||= competitor.player
  end

  def player_id
    player.id
  end

  def game
    match.game
  end
end
