json.array! @scores.each do |score|
  json.extract! score, :game_id, :position, :value
  json.url score_url(score, format: :json)
end
