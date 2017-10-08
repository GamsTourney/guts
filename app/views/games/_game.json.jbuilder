json.extract! game, :id, :name, :img_url, :scoring, :created_at, :updated_at
json.url tournament_game_url(@tournament, game, format: :json)
