class Player < ApplicationRecord
  has_many :competitors
  has_many :tournaments, through: :competitors
  has_many :matches, -> { distinct }, through: :tournaments

  validates :name, presence: true

  def tournament_competitor(tournament)
    competitors.where(tournament: tournament).first
  end

  def get_tournament_score(tournament)
    earned_points = tournament_competitor(tournament).match_results.collect(&:points)
    earned_points.inject(&:+) || 0
  end

  def steam_data
    player = SteamWebApi::Player.new(self.steam_id)
    player.summary.profile
  end
end
