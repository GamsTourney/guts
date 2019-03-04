class Tournament < ApplicationRecord
  has_many :competitors
  has_many :matches
  has_many :match_competitors, through: :competitors
  has_many :players, -> { distinct }, through: :competitors
  has_many :games, -> { distinct }, through: :matches

  validates :name, presence: true

  def reset
    if locked
      raise 'Tournament is locked! You must unlock the tournament to reset.'
    end

    matches.each do |m|
      m.match_competitors.each do |mc|
        mc.update(position: nil, points: 0)
      end
    end
  end

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

    all_points = match_competitors.sum(:points)
    random_index = all_points % 8
    random_player = players.all[random_index]
    point_grabber = players.max_by { |p| p.non_zero_rounds(self) }
    longest_streak = players.max_by { |p| p.longest_streak(self) || 0 }

    {
      point_grabber: {
        player: point_grabber.id,
        value: point_grabber.non_zero_rounds(self)
      },
      longest_streak: {
        player: longest_streak.id,
        value: longest_streak.longest_streak(self) || 0
      },
      most_disappointing: {
        player: random_player.id,
        value: all_points
      }
    }
  end
end
