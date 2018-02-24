class Player < ApplicationRecord
  has_many :competitors
  has_many :tournaments, through: :competitors
  has_many :matches, -> { distinct }, through: :tournaments

  validates :name, presence: true

  def tournament_competitor(tournament)
    competitors.where(tournament: tournament).first
  end

  def get_tournament_score(tournament)
    earned_points = tournament_competitor(tournament).match_competitors.collect(&:points)
    earned_points.inject(&:+) || 0
  end

  def steam_data
    SteamCache.get_player_summary(self.steam_id)
  end
end
