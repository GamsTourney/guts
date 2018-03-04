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
        score: player.score(self)
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
    most_second = second_places.max_by{|_, v| v}
    longest_streak_player = players.max_by{ |p| p.longest_streak(self) }
    game_crusher = players.max_by{ |p| p.most_game_wins(self)[:count] }

    {
      most_second_places: {
        player: Competitor.find(most_second[0]).player_id,
        value: most_second[1]
      },
      longest_streak: {
        player: longest_streak_player.id,
        value: longest_streak_player.longest_streak(self)
      },
      most_game_wins: {
        player: game_crusher.id,
        value: game_crusher.most_game_wins(self)[:count],
        game: Game.find(game_crusher.most_game_wins(self)[:game_id])
      }
    }
  end
end

