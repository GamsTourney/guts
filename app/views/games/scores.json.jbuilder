json.array! @game.scores.each do |score|
  json.extract! score, :id, :game_id, :position, :value
end
