class Player < ApplicationRecord
  has_many :competitors
  has_many :tournaments, through: :competitors

  validates :name, presence: true

  def tournament_competitor(tournament)
    competitors.where(tournament: tournament).first
  end

  def score(tournament)
    earned_points = tournament_competitor(tournament).match_competitors.collect(&:points)
    earned_points.inject(&:+) || 0
  end

  def longest_streak(tournament)
    rankings = tournament_competitor(tournament).match_competitors.collect(&:position)
    rankings.chunk { |x| x == 0 || nil }.map { |_, x| x.size }.max || 0
  end

  def most_game_wins(tournament)
    match_competitors = tournament_competitor(tournament).match_competitors
    game_wins = match_competitors.select { |mc| mc.position == 0 || nil }.collect(&:match).group_by(&:game_id)
    game_win_stats = game_wins.max_by { |matches| matches.size }
    if game_win_stats
      { game_id: game_win_stats[0], count: game_win_stats[1].size }
    else
      { count: 0 }
    end
  end

  def steam_data
    SteamCache.get_player_summary(self.steam_id)
  end

  def matches
    competitors.collect(&:matches).flatten
  end
end
