# frozen_string_literal: true

require_relative './helpers'

ActiveRecord::Base.transaction do
  # Tournament
  tournament = Tournament.find_or_create_by(name: 'Gams 2021')
  tournament_start = DateTime.new(2021, 3, 6, 10, 0, 0, '-5:00')

  # Players
  players = YAML.load_file('db/seeds/2021/players.yml')
  tournamentPlayers = players.map do |p|
    p = Player.find_or_create_by(name: p['name'], steam_id: p['steam_id'])
    p.password = SecureRandom.hex
    p
  end
  tournament.players = tournamentPlayers

  # Games
  games = YAML.load_file('db/seeds/2021/games.yml')
  Game.create(games)

  # Quake
  quake = Game.find_by(name: 'Quake Champions')
  Helpers.add_scores(quake, [4, 3, 2, 1, 1, 0, 0, 0])
  quake_start = DateTime.new(2021, 3, 6, 10, 0, 0, '-5:00')
  quake_schedule = [
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]]
  ]
  Helpers.create_matches(tournament, quake_schedule, quake_start, 7.minutes, [quake], 'rank')

  # KQB
  kqb = Game.find_by(name: 'Killer Queen Black')
  kqb_start = DateTime.new(2021, 3, 6, 11, 0, 0, '-5:00')
  kqb_schedule = [
    [[[6, 3, 5, 7], [2, 8, 1, 4]]],
    [[[6, 4, 5, 1], [2, 3, 7, 8]]],
    [[[4, 8, 1, 2], [5, 6, 3, 7]]],
    [[[5, 3, 2, 1], [7, 6, 4, 8]]],
    [[[2, 4, 6, 8], [1, 3, 5, 7]]],
    [[[7, 3, 8, 5], [4, 2, 6, 1]]],
    [[[8, 6, 7, 4], [2, 3, 1, 5]]]
  ]
  Helpers.create_matches(tournament, kqb_schedule, kqb_start, 7.minutes, [kqb], 'manual')

  # Brawlhalla
  brawl = Game.find_by(name: 'Brawlhalla')
  Helpers.add_scores(brawl, [3, 2, 1, 0])
  brawl_start = DateTime.new(2021, 3, 6, 12, 0, 0, '-5:00')
  brawl_schedule = [
    [[1, 4, 5, 8], [2, 3, 6, 7]],
    [[1, 2, 3, 5], [4, 6, 7, 8]],
    [[1, 3, 6, 8], [2, 4, 5, 7]],
    [[2, 5, 6, 8], [1, 3, 4, 7]],
    [[1, 2, 7, 8], [3, 4, 5, 6]],
    [[3, 5, 7, 8], [1, 2, 4, 6]],
    [[1, 5, 6, 7], [2, 3, 4, 8]]
  ]
  Helpers.create_matches(tournament, brawl_schedule, brawl_start, 7.minutes, [brawl, brawl], 'rank')

  # Swords and Soldiers 2
  sns = Game.find_by(name: 'Swords and Soldiers 2')
  Helpers.add_scores(sns, [2, 0])
  sns_start = DateTime.new(2021, 3, 6, 13, 0, 0, '-5:00')
  sns_schedule = [
    [[2, 4], [1, 5], [6, 7], [3, 8]],
    [[3, 4], [2, 5], [1, 6], [7, 8]],
    [[3, 5], [2, 6], [1, 7], [4, 8]],
    [[4, 5], [3, 6], [2, 7], [1, 8]],
    [[1, 2], [4, 6], [3, 7], [5, 8]],
    [[1, 3], [5, 6], [4, 7], [2, 8]],
    [[2, 3], [1, 4], [5, 7], [6, 8]]
  ]
  Helpers.create_matches(tournament, sns_schedule, sns_start, 10.minutes, [sns, sns, sns, sns], 'rank')

  # Tetris
  tetris = Game.find_by(name: 'Tetris')
  Helpers.add_scores(tetris, [3, 2, 2, 1, 1, 0, 0, 0])
  tetris_start = DateTime.new(2021, 3, 6, 15, 0, 0, '-5:00')
  tetris_schedule = [
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]],
    [[1, 2, 3, 4, 5, 6, 7, 8]]
  ]
  Helpers.create_matches(tournament, tetris_schedule, tetris_start, 7.minutes, [tetris], 'rank')

  # Golf
  golf = Game.find_by(name: 'Golf With Your Friends')
  golf_start = DateTime.new(2021, 3, 6, 16, 0, 0, '-5:00')
  Helpers.create_matches(tournament, [[[1, 2, 3, 4, 5, 6, 7, 8]]], golf_start, 1.hours, [golf], 'manual')
end
