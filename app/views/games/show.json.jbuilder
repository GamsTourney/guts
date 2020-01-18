json.extract! @game, :id, :name, :img_url, :players, :max_score
json.url game_url(@game, format: :json)
json.scores game.scores.each do |score|
  json.extract! score, :id, :position, :value
end
if @tournament
  json.tournament_id @tournament.id
end
