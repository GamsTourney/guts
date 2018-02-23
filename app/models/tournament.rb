class Tournament < ApplicationRecord
  has_many :competitors
  has_many :players, through: :competitors
  has_many :matches, through: :competitors
  has_many :games, -> { distinct }, through: :matches

  validates :name, presence: true

  def standings
    standings_map = {}
    players.each do |player|
      standings_map[player.id] = player.get_tournament_score(self)
    end
    standings_map
  end
end
