require_relative './helpers'

ActiveRecord::Base.transaction do

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

# All Day
gh3 = Game.find_by(name: 'Guitar Hero 3')
pac = Game.find_by(name: 'Ms. Pac-Man')
Helpers.add_scores(gh3, [8, 6, 4, 3, 2, 1, 0, 0])
Helpers.add_scores(pac, [8, 6, 4, 3, 2, 1, 0, 0])
Helpers.create_matches(tournament, [[[1,2,3,4,5,6,7,8]]], tournament_start, 9.hours, [gh3], 'rank', { hidden: true })
Helpers.create_matches(tournament, [[[1,2,3,4,5,6,7,8]]], tournament_start, 9.hours, [pac], 'rank', { hidden: true })

# Morning
unreal = Game.find_by(name: 'Unreal Tournament')
smash = Game.find_by(name: 'Super Smash Brothers')
Helpers.add_scores(unreal, [4, 2, 1, 0])
Helpers.add_scores(smash, [4, 2, 1, 0])
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
Helpers.create_matches(tournament, morning_schedule, morning_start, 12.minutes, morning_games, 'rank')

# Afternoon - can we get 2 sessions of each going?
mk2 = Game.find_by(name: 'Mortal Kombat II')
blitz = Game.find_by(name: 'Blitz 2001')
Helpers.add_scores(mk2, [3, 0])
Helpers.add_scores(blitz, [3, 0])
afternoon_games = [mk2, blitz]
afternoon_start = DateTime.new(2018, 3, 10, 12, 30, 0, '-5:00')
afternoon_schedule = [
  [[5,3], [7,6]],
  [[4,7], [5,1]],
  [[2,1], [3,8]],
  [[8,6], [4,2]],
  [[5,4], [6,2]],
  [[2,3], [1,4]],
  [[8,7], [3,1]],
  [[6,1], [7,3]],
  [[5,2], [4,6]],
  [[8,4], [5,7]],
  [[6,3], [5,8]],
  [[1,7], [2,8]],
  [[5,6], [2,1]],
  [[1,8], [3,7]],
  [[7,2], [5,4]],
  [[3,4], [6,8]]
]
Helpers.create_matches(tournament, afternoon_schedule, afternoon_start, 8.minutes, afternoon_games, 'rank')

# Late Afternoon Start
grid = Game.find_by(name: 'Grid 2')
mount = Game.find_by(name: 'Mount Your Friends')
Helpers.add_scores(grid, [4, 2, 1, 0])
Helpers.add_scores(mount, [4, 2, 1, 0])
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
Helpers.create_matches(tournament, late_schedule, late_start, 12.minutes, late_games, 'rank')

end
