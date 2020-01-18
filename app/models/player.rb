class Player < ApplicationRecord
  has_secure_password
  has_many :competitors
  has_many :tournaments, through: :competitors

  validates :name, presence: true

  def tournament_competitor(tournament)
    competitors.where(tournament: tournament).first
  end

  def score(tournament)
    tournament_competitor(tournament).match_competitors.sum(:points)
  end

  def steam_data
    SteamCache.get_player_summary(self.steam_id)
  end
end
