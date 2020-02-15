require_relative './helpers'

ActiveRecord::Base.transaction do

# Tournament
tournament = Tournament.find_or_create_by(name: 'Gams 2020')
tournament_start = DateTime.new(2020, 2, 29, 10, 0, 0, '-5:00')

# Players
players = YAML::load_file("db/seeds/2020/players.yml")
tournamentPlayers = players.map { |p|
  Player.find_or_create_by(name: p['name'], steam_id: p['steam_id'])
}
tournament.players = tournamentPlayers

# Games
games = YAML::load_file("db/seeds/2020/games.yml")
Game.create(games)

# Halo
halo = Game.find_by(name: 'Halo: Reach')
halo_start = DateTime.new(2020, 2, 29, 10, 0, 0, '-5:00')
halo_schedule = [
  [[[6,3,5,7], [2,8,1,4]]],
  [[[6,4,5,1], [2,3,7,8]]],
  [[[4,8,1,2], [5,6,3,7]]],
  [[[5,3,2,1], [7,6,4,8]]],
  [[[2,4,6,8], [1,3,5,7]]],
  [[[7,3,8,5], [4,2,6,1]]],
  [[[8,6,7,4], [2,3,1,5]]]
]
Helpers.create_matches(tournament, halo_schedule, halo_start, 7.minutes, [halo], 'manual')

# NBA Hang Time
hang = Game.find_by(name: 'NBA Hang Time')
Helpers.add_scores(hang, [2, 2, 0, 0])
hang_start = DateTime.new(2020, 2, 29, 11, 0, 0, '-5:00')
hang_schedule = [
  [[[4,5], [3,6]], [[2,7], [1,8]]],
  [[[1,2], [4,6]], [[3,7], [5,8]]],
  [[[1,3], [5,6]], [[4,7], [2,8]]],
  [[[2,3], [1,4]], [[5,7], [6,8]]],
  [[[2,4], [1,5]], [[6,7], [3,8]]],
  [[[3,4], [2,5]], [[1,6], [7,8]]],
  [[[3,5], [2,6]], [[1,7], [4,8]]]
]
Helpers.create_matches(tournament, hang_schedule, hang_start, 8.minutes, [hang, hang], 'manual')

# Amorphous
amorphous = Game.find_by(name: 'Amorphous+')
amorphous_start = DateTime.new(2020, 2, 29, 12, 30, 0, '-5:00')
Helpers.add_scores(amorphous, [8, 6, 4, 3, 2, 1, 1, 0])
Helpers.create_matches(tournament, [[[1,2,3,4,5,6,7,8]]], amorphous_start, 30.minutes, [amorphous], 'rank')

# Nidhogg
nidhogg = Game.find_by(name: 'Nidhogg')
Helpers.add_scores(nidhogg, [2, 0])
nidhogg_start = DateTime.new(2020, 2, 29, 13, 05, 0, '-5:00')
nidhogg_schedule = [
  [[2,4], [1,5], [6,7], [3,8]],
  [[3,4], [2,5], [1,6], [7,8]],
  [[3,5], [2,6], [1,7], [4,8]],
  [[4,5], [3,6], [2,7], [1,8]],
  [[1,2], [4,6], [3,7], [5,8]],
  [[1,3], [5,6], [4,7], [2,8]],
  [[2,3], [1,4], [5,7], [6,8]]
]
Helpers.create_matches(tournament, nidhogg_schedule, nidhogg_start, 5.minutes, [nidhogg, nidhogg, nidhogg, nidhogg], 'rank')

# Worms
worms = Game.find_by(name: 'Worms Clan Wars')
Helpers.add_scores(worms, [4, 2, 1, 0])
w_start = DateTime.new(2020, 2, 29, 13, 50, 0, '-5:00')
w_schedule = [
  [[1,6,7,8],	[2,3,4,5]],
  [[1,3,4,6],	[2,5,7,8]],
  [[1,2,5,6],	[3,4,7,8]],
  [[1,2,3,7],	[4,5,6,8]],
  [[1,3,5,8],	[2,4,6,7]]
]
Helpers.create_matches(tournament, w_schedule, w_start, 12.minutes, [worms, worms], 'rank')

# Smash Ultimate
smash = Game.find_by(name: 'Smash Ultimate')
Helpers.add_scores(smash, [2, 0])
smash_start = DateTime.new(2020, 2, 29, 15, 0, 0, '-5:00')
smash_schedule = [
  [[3,4], [2,5], [1,6], [7,8]],
  [[3,5], [2,6], [1,7], [4,8]],
  [[4,5], [3,6], [2,7], [1,8]],
  [[1,2], [4,6], [3,7], [5,8]],
  [[1,3], [5,6], [4,7], [2,8]],
  [[2,3], [1,4], [5,7], [6,8]],
  [[2,4], [1,5], [6,7], [3,8]]
]
Helpers.create_matches(tournament, smash_schedule, smash_start, 7.minutes, [smash, smash, smash, smash], 'rank')

# Speedrunners
speedrunners = Game.find_by(name: 'Speedrunners')
speed_start = DateTime.new(2020, 2, 29, 16, 0, 0, '-5:00')
speed_schedule = [
  [[1,4,5,8], [2,3,6,7]],
  [[1,2,3,5], [4,6,7,8]],
  [[1,3,6,8], [2,4,5,7]],
  [[2,5,6,8], [1,3,4,7]],
  [[1,2,7,8], [3,4,5,6]],
  [[3,5,7,8], [1,2,4,6]],
  [[1,5,6,7], [2,3,4,8]]
]
Helpers.create_matches(tournament, speed_schedule, speed_start, 8.minutes, [speedrunners, speedrunners], 'manual')

# Kart
kart = Game.find_by(name: 'Mario Kart 8')
Helpers.add_scores(kart, [4, 3, 2, 2, 1, 1, 0, 0])
kart_start = DateTime.new(2020, 2, 29, 17, 0, 0, '-5:00')
kart_schedule = Array.new(8, [[1,2,3,4,5,6,7,8]])
Helpers.create_matches(tournament, kart_schedule, kart_start, 5.minutes, [kart], 'rank')

end
