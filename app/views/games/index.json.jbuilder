json.array! @games.each do |game|
  json.extract! game, :id, :name, :img_url, :players
  json.url game_url(game, format: :json)
  if @tournament
    json.tournament_id @tournament.id
  end
end
