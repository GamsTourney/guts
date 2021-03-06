class Player < ApplicationRecord
  has_secure_password
  has_many :competitors
  has_many :matches, through: :competitors
  has_many :tournaments, through: :competitors
  has_many :medals

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

  def invite(tournament)
    PlayerMailer.invite(self, tournament).deliver_now
  end
end
