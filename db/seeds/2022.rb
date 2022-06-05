# frozen_string_literal: true

require_relative './helpers'

ActiveRecord::Base.transaction do
  # Tournament
  tournament = Tournament.find_or_create_by(name: 'Gams 2022')
  tournament_start = DateTime.new(2022, 6, 18, 8, 0, 0, '-5:00')

  # Players
  players = YAML.load_file('db/seeds/2022/players.yml')
  tournamentPlayers = players.map do |p|
    p = Player.find_or_create_by(name: p['name'], steam_id: p['steam_id'])
    p.password = SecureRandom.hex
    p
  end
  tournament.players = tournamentPlayers

  # Games
  games = YAML.load_file('db/seeds/2022/games.yml')

  # Halo
  halo = Game.find_by(name: 'Halo')
  halo_start = DateTime.new(2022, 6, 18, 8, 0, 0, '-5:00')
  halo_schedule = [
    [[[6, 3, 5, 7], [2, 8, 1, 4]]],
    [[[6, 4, 5, 1], [2, 3, 7, 8]]],
    [[[4, 8, 1, 2], [5, 6, 3, 7]]],
    [[[5, 3, 2, 1], [7, 6, 4, 8]]],
    [[[2, 4, 6, 8], [1, 3, 5, 7]]],
    [[[7, 3, 8, 5], [4, 2, 6, 1]]],
    [[[8, 6, 7, 4], [2, 3, 1, 5]]]
  ]
  Helpers.create_matches(tournament, halo_schedule, halo_start, 8.minutes, [halo], 'manual')

  # Speedrunners
  speedrunners = Game.find_by(name: 'Speedrunners')
  speed_start = DateTime.new(2022, 6, 18, 9, 0, 0, '-5:00')
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

  # KQB
  kqb = Game.find_by(name: 'Killer Queen Black')
  kqb_start = DateTime.new(2022, 6, 18, 10, 0, 0, '-5:00')
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

  # Battlerite
  battlerite = Game.find_by(name: 'Battlerite')
  br_start = DateTime.new(2022, 6, 18, 11, 30, 0, '-5:00')
  br_schedule = [
    [[[4,5], [3,6]], [[2,7], [1,8]]],
    [[[1,2], [4,6]], [[3,7], [5,8]]],
    [[[1,3], [5,6]], [[4,7], [2,8]]],
    [[[2,3], [1,4]], [[5,7], [6,8]]],
    [[[2,4], [1,5]], [[6,7], [3,8]]],
    [[[3,4], [2,5]], [[1,6], [7,8]]],
    [[[3,5], [2,6]], [[1,7], [4,8]]]
  ]
  Helpers.create_matches(tournament, br_schedule, br_start, 8.minutes, [battlerite, battlerite], 'manual')

  # Rocket League
  rocket = Game.find_by(name: 'Rocket League')
  rocket_start = DateTime.new(2022, 6, 18, 12, 30, 0, '-5:00')
  rocket_schedule = [
    [[[3,4], [2,5]], [[1,6], [7,8]]],
    [[[3,5], [2,6]], [[1,7], [4,8]]],
    [[[4,5], [3,6]], [[2,7], [1,8]]],
    [[[1,2], [4,6]], [[3,7], [5,8]]],
    [[[1,3], [5,6]], [[4,7], [2,8]]],
    [[[2,3], [1,4]], [[5,7], [6,8]]],
    [[[2,4], [1,5]], [[6,7], [3,8]]]
  ]
  Helpers.create_matches(tournament, rocket_schedule, rocket_start, 8.minutes, [rocket, rocket], 'manual')

  # Tetris
  tetris = Game.find_by(name: 'Tetris')
  Helpers.add_scores(tetris, [4, 3, 2, 2, 1, 1, 0, 0])
  tetris_start = DateTime.new(2022, 6, 18, 14, 0, 0, '-5:00')
  tetris_schedule = Array.new(8, [[1,2,3,4,5,6,7,8]])
  Helpers.create_matches(tournament, tetris_schedule, tetris_start, 5.minutes, [tetris], 'rank')

  # Mount Your Friends
  mount = Game.find_by(name: 'Mount Your Friends')
  Helpers.add_scores(mount, [4, 2, 1, 0])
  late_start = DateTime.new(2022, 6, 18, 15, 00, 0, '-5:00')
  late_schedule =[
    [[2,5,6,4], [1,3,7,8]],
    [[1,3,5,7], [2,4,6,8]],
    [[3,8,5,1], [6,2,4,7]],
    [[7,3,4,2], [8,5,6,1]],
    [[2,7,6,3], [8,5,4,1]],
    [[1,8,5,6], [2,3,4,7]],
    [[2,4,6,8], [1,3,5,7]]
  ]
  Helpers.create_matches(tournament, late_schedule, late_start, 8.minutes, [mount, mount], 'rank')

  # Mario Kart
  kart = Game.find_by(name: 'Mario Kart 8')
  Helpers.add_scores(kart, [4, 3, 2, 2, 1, 1, 0, 0])
  kart_start = DateTime.new(2022, 6, 18, 16, 0, 0, '-5:00')
  kart_schedule = Array.new(8, [[1,2,3,4,5,6,7,8]])
  Helpers.create_matches(tournament, kart_schedule, kart_start, 5.minutes, [kart], 'rank')
end
