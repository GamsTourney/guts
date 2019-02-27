module Helpers
  def self.add_scores(game, scores)
    scores.each_with_index do |score, idx|
      Score.create(game: game, position: idx, value: score)
    end
  end

  def self.gather_competitors(tournament, ids, team = nil)
    puts team
    competitors = tournament.competitors.where(player_id: ids)
    competitors.map do |c|
      MatchCompetitor.new({ competitor_id: c.id, team: team })
    end
  end

  def self.create_matches(tournament, schedule, start, game_duration, games, options = {})
    schedule.each_with_index do |event, scheduleIdx|
      start_time = start + (scheduleIdx * game_duration)
      event.each_with_index do |players, eventIdx|
        competitors = []
        if (players[eventIdx].kind_of?(Array))
          teamAdj = players.length * eventIdx
          players.each_with_index do |team, teamIdx|
            competitors.concat(gather_competitors(tournament, team, teamAdj + teamIdx))
          end
        else
          competitors = gather_competitors(tournament, players)
        end
        Match.create(
          game: games[eventIdx],
          tournament: tournament,
          match_competitors: competitors,
          start_time: start_time,
          end_time: start_time + game_duration,
          hidden: options[:hidden]
        )
      end
    end
  end
end
