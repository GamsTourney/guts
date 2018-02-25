# Tournament
tournament = Tournament.create(name: 'Gams 2018')
tournament_start = DateTime.new(2018, 3, 10, 10, 0, 0, '-5:00')

# Players
players = YAML::load_file("db/seeds/2018/players.yml")
players = Player.create(players)
tournament.players = players

# Games
games = YAML::load_file("db/seeds/2018/games.yml")
Game.create(games)

# Scores

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

# All Day
gh3 = Game.find_by(name: 'Guitar Hero 3')
pac = Game.find_by(name: 'Ms. Pac-Man')
add_scores(gh3, [8, 6, 4, 3, 2, 1, 0, 0])
add_scores(pac, [8, 6, 4, 3, 2, 1, 0, 0])
create_matches(tournament, [[[1,2,3,4,5,6,7,8]]], tournament_start, 9.hours, [gh3], true)
create_matches(tournament, [[[1,2,3,4,5,6,7,8]]], tournament_start, 9.hours, [pac], true)

# Morning
unreal = Game.find_by(name: 'Unreal Tournament')
smash = Game.find_by(name: 'Super Smash Brothers')
add_scores(unreal, [4, 2, 1, 0])
add_scores(smash, [4, 2, 1, 0])
morning_games = [unreal, smash]
morning_start = DateTime.new(2018, 3, 10, 10, 0, 0, '-5:00')
morning_schedule = [
  [[6,3,5,7], [2,8,1,4]],
  [[6,4,5,1], [2,3,7,8]],
  [[4,8,1,2], [5,6,3,7]],
  [[5,3,2,1], [7,6,4,8]],
  [[1,3,5,7], [2,4,6,8]],
  [[7,3,8,5], [4,2,6,1]],
  [[8,6,7,4], [2,3,1,5]],
  [[6,4,3,2], [1,7,5,8]],
  [[8,2,1,7], [4,3,5,6]],
  [[2,4,6,8], [1,3,5,7]]
]
create_matches(tournament, morning_schedule, morning_start, 12.minutes, morning_games)

# Afternoon - can we get 2 sessions of each going?
mk2 = Game.find_by(name: 'Mortal Kombat II')
blitz = Game.find_by(name: 'Blitz 2000')
add_scores(mk2, [3, 0])
add_scores(blitz, [3, 0])
afternoon_games = [mk2, blitz]
afternoon_start = DateTime.new(2018, 3, 10, 12, 30, 0, '-5:00')
afternoon_schedule = [
  [[6,4], [3,5]],
  [[1,2], [8,7]],
  [[3,6], [7,4]],
  [[2,8], [1,5]],
  [[7,8], [1,2]],
  [[5,4], [3,6]],
  [[1,8], [7,3]],
  [[5,4], [2,6]],
  [[7,5], [2,6]],
  [[3,8], [1,4]],
  [[2,6], [3,1]],
  [[7,5], [8,4]],
  [[6,4], [7,5]],
  [[1,3], [8,2]],
  [[7,2], [6,8]],
  [[3,1], [5,4]]
]
create_matches(tournament, afternoon_schedule, afternoon_start, 8.minutes, afternoon_games)

# Late Afternoon Start
grid = Game.find_by(name: 'Grid 2')
mount = Game.find_by(name: 'Mount Your Friends')
add_scores(grid, [4, 2, 1, 0])
add_scores(mount, [4, 2, 1, 0])
late_games = [grid, mount]
late_start = DateTime.new(2018, 3, 10, 15, 00, 0, '-5:00')
late_schedule =[
  [[4,8,2,6], [7,1,5,3]],
  [[1,5,7,8], [2,3,4,6]],
  [[1,3,7,4], [6,8,5,2]],
  [[2,5,6,4], [1,3,7,8]],
  [[1,3,5,7], [2,4,6,8]],
  [[3,8,5,1], [6,2,4,7]],
  [[7,3,4,2], [8,5,6,1]],
  [[2,7,6,3], [8,5,4,1]],
  [[1,8,5,6], [2,3,4,7]],
  [[2,4,6,8], [1,3,5,7]]
]
create_matches(tournament, late_schedule, late_start, 12.minutes, late_games)
