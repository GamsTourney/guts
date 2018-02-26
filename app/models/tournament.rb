class Tournament < ApplicationRecord
  has_many :competitors
  has_many :matches
  has_many :players, -> { distinct }, through: :competitors
  has_many :games, -> { distinct }, through: :matches

  validates :name, presence: true

  def standings
    standings_collection = []
    players.each do |player|
      standings_collection << {
        player: player.id,
        score: player.get_tournament_score(self)
      }
    end
    standings_collection
  end
end
