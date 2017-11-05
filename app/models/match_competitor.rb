class MatchCompetitor < ApplicationRecord
  belongs_to :match
  belongs_to :competitor
end
