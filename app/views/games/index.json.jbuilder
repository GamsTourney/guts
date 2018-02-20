json.games do
  json.array! @games.each do |game|
    json.extract! game, :id, :name, :img_url, :players, :created_at, :updated_at
    json.url game_url(game, format: :json)
    json.partial! 'application/includes', obj: game, allowed: [:scores]
  end
end
