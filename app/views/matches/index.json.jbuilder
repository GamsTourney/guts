json.array! @matches.each do |match|
  json.extract! match, :id, :game_id, :start_time, :created_at, :updated_at
  json.players match.players
  json.url match_url(match, format: :json)
end

