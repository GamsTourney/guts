json.array! @matches.each do |match|
  json.extract! match, :id, :game_id, :tournament_id, :score_type, :start_time, :end_time, :hidden, :score_type
  json.url match_url(match, format: :json)
  json.completed match.completed?
  json.match_competitors match.match_competitors.each do |mc|
    json.extract! mc, :id, :match_id, :competitor_id, :position, :team, :player_id, :points
  end
end
