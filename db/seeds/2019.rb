require_relative './helpers'

# Tournament
tournament = Tournament.find_or_create_by(name: 'Gams 2019')
tournament_start = DateTime.new(2019, 3, 10, 10, 0, 0, '-5:00')

# # Players
players = YAML::load_file("db/seeds/2019/players.yml")
tournamentPlayers = players.map { |p|
  Player.find_by(name: p['name'])
}
tournament.players = tournamentPlayers

# # Games
games = YAML::load_file("db/seeds/2019/games.yml")
Game.create(games)

# All Day
icy = Game.find_by(name: 'Icy Tower')
Helpers.add_scores(icy, [8, 6, 4, 3, 2, 1, 0, 0])
Helpers.create_matches(tournament, [[[1,2,3,4,5,6,7,8]]], tournament_start, 9.hours, [icy], true)

# CS GO
csgo = Game.find_by(name: 'Counter-Strike: Global Offensive')
Helpers.add_scores(csgo, [2, 2, 2, 2, 0, 0, 0, 0])
cs_start = DateTime.new(2018, 3, 10, 10, 0, 0, '-5:00')
cs_schedule = Array.new(8, [[1,2,3,4,5,6,7,8]])
Helpers.create_matches(tournament, cs_schedule, cs_start, 7.minutes, [csgo])

# Mario Tennis Aces
mario_tennis = Game.find_by(name: 'Mario Tennis Aces')
Helpers.add_scores(mario_tennis, [3, 3, 0, 0])
mt_start = DateTime.new(2018, 3, 10, 11, 0, 0, '-5:00')
mt_schedule = [
  [[4,5,3,6], [2,7,1,8]],
  [[1,2,4,6], [3,7,5,8]],
  [[1,3,5,6], [4,7,2,8]],
  [[2,3,1,4], [5,7,6,8]],
  [[2,4,1,5], [6,7,3,8]],
  [[3,4,2,5], [1,6,7,8]],
  [[3,5,2,6], [1,7,4,8]]
]
Helpers.create_matches(tournament, mt_schedule, mt_start, 5.minutes, [mario_tennis, mario_tennis])
