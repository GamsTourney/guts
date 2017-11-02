json.extract! game, :id, :name, :img_url, :scoring, :created_at, :updated_at
json.url game_url(game, format: :json)
