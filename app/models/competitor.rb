class Competitor < ActiveRecord::Base
  belongs_to :player
  belongs_to :tournament
  has_many :match_competitors
  has_many :matches, through: :match_competitors
  has_many :match_results, through: :match_competitors
end
