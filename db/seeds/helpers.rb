# Scores

module Helpers
  def add_scores(game, scores)
    scores.each_with_index do |score, idx|
      Score.create(game: game, position: idx, value: score)
    end
  end

  # Matches

  def gather_competitors(tournament, ids)
    competitors = tournament.competitors
    ids.map { |id| competitors[id - 1] }
  end

  def create_matches(tournament, schedule, start, game_duration, games, hidden = false)
    schedule.each_with_index do |event, idx|
      start_time = start + (idx * game_duration)
      event.each_with_index do |players, idx|
        competitors = gather_competitors(tournament, players)
        Match.create(
          game: games[idx],
          tournament: tournament,
          competitors: competitors,
          start_time: start_time,
          end_time: start_time + game_duration,
          hidden: hidden
        )
      end
    end
  end
end
