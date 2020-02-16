json.array! @games.each do |game|
  json.extract! game, :id, :genre, :details, :name, :img_url, :players, :max_score
  json.scores game.scores.each do |score|
    json.extract! score, :id, :position, :value
  end
  json.url game_url(game, format: :json)
  if @tournament
    json.tournament_id @tournament.id
  end
end
