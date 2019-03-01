require_relative './helpers'

ActiveRecord::Base.transaction do

# Tournament
tournament = Tournament.find_or_create_by(name: 'Gams 2019')
tournament_start = DateTime.new(2019, 3, 10, 10, 0, 0, '-5:00')

# Players
players = YAML::load_file("db/seeds/2019/players.yml")
tournamentPlayers = players.map { |p|
  Player.find_by(name: p['name'])
}
tournament.players = tournamentPlayers

# Games
games = YAML::load_file("db/seeds/2019/games.yml")
Game.create(games)

# All Day
icy = Game.find_by(name: 'Icy Tower')
Helpers.add_scores(icy, [8, 6, 4, 3, 2, 1, 0, 0])
Helpers.create_matches(tournament, [[[1,2,3,4,5,6,7,8]]], tournament_start, 9.hours, [icy], { hidden: true })

# CS GO
csgo = Game.find_by(name: 'Counter-Strike: Global Offensive')
Helpers.add_scores(csgo, [2, 2, 2, 2, 0, 0, 0, 0])
cs_start = DateTime.new(2018, 3, 10, 10, 0, 0, '-5:00')
cs_schedule = [
  [[[6,3,5,7], [2,8,1,4]]],
  [[[6,4,5,1], [2,3,7,8]]],
  [[[4,8,1,2], [5,6,3,7]]],
  [[[5,3,2,1], [7,6,4,8]]],
  [[[2,4,6,8], [1,3,5,7]]],
  [[[7,3,8,5], [4,2,6,1]]],
  [[[8,6,7,4], [2,3,1,5]]]
]
Helpers.create_matches(tournament, cs_schedule, cs_start, 7.minutes, [csgo])

# Mario Tennis Aces
mario_tennis = Game.find_by(name: 'Mario Tennis Aces')
Helpers.add_scores(mario_tennis, [3, 3, 0, 0])
mt_start = DateTime.new(2018, 3, 10, 11, 0, 0, '-5:00')
mt_schedule = [
  [[[4,5], [3,6]], [[2,7], [1,8]]],
  [[[1,2], [4,6]], [[3,7], [5,8]]],
  [[[1,3], [5,6]], [[4,7], [2,8]]],
  [[[2,3], [1,4]], [[5,7], [6,8]]],
  [[[2,4], [1,5]], [[6,7], [3,8]]],
  [[[3,4], [2,5]], [[1,6], [7,8]]],
  [[[3,5], [2,6]], [[1,7], [4,8]]]
]
Helpers.create_matches(tournament, mt_schedule, mt_start, 5.minutes, [mario_tennis, mario_tennis])

# Pokemon Stadium
pokemon_stadium = Game.find_by(name: 'Pokemon Stadium')
Helpers.add_scores(pokemon_stadium, [0, 0, 0, 0])
ps_start = DateTime.new(2018, 3, 10, 11, 45, 0, '-5:00')
ps_schedule = [
  [[1,6,7,8],	[2,3,4,5]],
  [[1,3,4,6],	[2,5,7,8]],
  [[1,2,5,6],	[3,4,7,8]],
  [[1,2,3,7],	[4,5,6,8]],
  [[1,3,5,8],	[2,4,6,7]],
  [[2,3,6,8],	[1,4,5,7]],
  [[3,5,6,7],	[1,2,4,8]]
]
Helpers.create_matches(tournament, ps_schedule, ps_start, 7.minutes, [pokemon_stadium, pokemon_stadium])

# Swords and Soldiers
sns = Game.find_by(name: 'Swords and Soldiers')
Helpers.add_scores(sns, [2, 0])
sns_start = DateTime.new(2018, 3, 10, 13, 0, 0, '-5:00')
sns_schedule = [
  [[2,4], [1,5], [6,7], [3,8]],
  [[3,4], [2,5], [1,6], [7,8]],
  [[3,5], [2,6], [1,7], [4,8]],
  [[4,5], [3,6], [2,7], [1,8]],
  [[1,2], [4,6], [3,7], [5,8]],
  [[1,3], [5,6], [4,7], [2,8]],
  [[2,3], [1,4], [5,7], [6,8]]
]
Helpers.create_matches(tournament, sns_schedule, sns_start, 7.minutes, [sns, sns, sns, sns])

# Battlerite
battlerite = Game.find_by(name: 'Battlerite')
Helpers.add_scores(battlerite, [1, 1, 0, 0])
br_start = DateTime.new(2018, 3, 10, 14, 0, 0, '-5:00')
br_schedule = [
  [[[4,5], [3,6]], [[2,7], [1,8]]],
  [[[1,2], [4,6]], [[3,7], [5,8]]],
  [[[1,3], [5,6]], [[4,7], [2,8]]],
  [[[2,3], [1,4]], [[5,7], [6,8]]],
  [[[2,4], [1,5]], [[6,7], [3,8]]],
  [[[3,4], [2,5]], [[1,6], [7,8]]],
  [[[3,5], [2,6]], [[1,7], [4,8]]]
]
Helpers.create_matches(tournament, br_schedule, br_start, 10.minutes, [battlerite, battlerite])

# Diddy Kong Racing
dkr = Game.find_by(name: 'Diddy Kong Racing')
Helpers.add_scores(dkr, [3, 2, 1, 0])
dkr_start = DateTime.new(2018, 3, 10, 15, 20, 0, '-5:00')
dkr_schedule = [
  [[1,4,5,8], [2,3,6,7]],
  [[1,2,3,5], [4,6,7,8]],
  [[1,3,6,8], [2,4,5,7]],
  [[2,5,6,8], [1,3,4,7]],
  [[1,2,7,8], [3,4,5,6]],
  [[3,5,7,8], [1,2,4,6]],
  [[1,5,6,7], [2,3,4,8]]
]
Helpers.create_matches(tournament, dkr_schedule, dkr_start, 5.minutes, [dkr, dkr])

# Swords and Soldiers
mvc = Game.find_by(name: 'Marvel vs. Capcom 3')
Helpers.add_scores(mvc, [2, 0])
mvc_start = DateTime.new(2018, 3, 10, 16, 0, 0, '-5:00')
mvc_schedule = [
  [[3,4], [2,5], [1,6], [7,8]],
  [[3,5], [2,6], [1,7], [4,8]],
  [[4,5], [3,6], [2,7], [1,8]],
  [[1,2], [4,6], [3,7], [5,8]],
  [[1,3], [5,6], [4,7], [2,8]],
  [[2,3], [1,4], [5,7], [6,8]],
  [[2,4], [1,5], [6,7], [3,8]]
]
Helpers.create_matches(tournament, mvc_schedule, mvc_start, 5.minutes, [mvc, mvc, mvc, mvc])

# Chivalry
chivalry = Game.find_by(name: 'Chivalry')
Helpers.add_scores(chivalry, [4, 3, 2, 2, 1, 1, 0, 0])
chivalry_start = DateTime.new(2018, 3, 10, 16, 45, 0, '-5:00')
chivalry_schedule = Array.new(7, [[1,2,3,4,5,6,7,8]])
Helpers.create_matches(tournament, chivalry_schedule, chivalry_start, 7.minutes, [chivalry])

end
