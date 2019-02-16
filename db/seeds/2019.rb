require_relative './helpers'

# Tournament
tournament = Tournament.create(name: 'Gams 2019')
tournament_start = DateTime.new(2019, 3, 10, 10, 0, 0, '-5:00')

# Players
players = YAML::load_file("db/seeds/2019/players.yml")
tournament.players = players

# Games
games = YAML::load_file("db/seeds/2019/games.yml")
Game.create(games)

# All Day
icy = Game.find_by(name: 'Icy Tower')
Helpers.add_scores(icy, [8, 6, 4, 3, 2, 1, 0, 0])
Helpers.create_matches(tournament, [[[1,2,3,4,5,6,7,8]]], tournament_start, 9.hours, [icy], true)
