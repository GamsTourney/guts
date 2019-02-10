# Tournament
tournament = Tournament.create(name: 'Gams 2019')
tournament_start = DateTime.new(2019, 3, 10, 10, 0, 0, '-5:00')

# Players
players = YAML::load_file("db/seeds/2019/players.yml")
players = Player.create(players)
tournament.players = players

# Games
games = YAML::load_file("db/seeds/2019/games.yml")
Game.create(games)
