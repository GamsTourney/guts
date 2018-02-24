class MatchCompetitor < ApplicationRecord
  belongs_to :match
  belongs_to :competitor
  belongs_to :player, through: :competitor

  def points
    match.scores.where(position: position).first.value
  end
end
