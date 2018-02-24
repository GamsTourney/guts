class MatchCompetitor < ApplicationRecord
  belongs_to :match
  belongs_to :competitor
  has_one :match_result
end
