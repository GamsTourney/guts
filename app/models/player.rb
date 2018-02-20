class Player < ApplicationRecord
  has_many :competitors
  has_many :tournaments, through: :competitors
  has_many :matches, -> { distinct }, through: :tournaments

  validates :name, presence: true

  def steam_data
    SteamCache.get_player_summary(self.steam_id)
  end
end
