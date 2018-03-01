class Tournament < ApplicationRecord
  has_many :competitors
  has_many :matches
  has_many :match_competitors, through: :competitors
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

  # Shortcut -- needed an easy way to aggregate the useless stats
  def gather_stats
    if matches.none?(&:completed?)
      return {}
    end

    second_places = match_competitors.where(position: 1).group(:competitor_id).size
    most_second = second_places.max_by{|k,v| v}

    {
      most_second_places: {
        player: Competitor.find(most_second[0]).player_id,
        value: most_second[1]
      }
    }
  end
end
