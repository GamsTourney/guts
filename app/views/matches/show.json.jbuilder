json.extract! @match, :id, :game_id, :tournament_id, :score_type, :start_time, :end_time, :hidden
json.url match_url(@match, format: :json)
json.completed @match.completed?
json.array! @match.match_competitors.each do |mc|
  json.extract! mc, :id, :match_id, :competitor_id, :position, :team, :player_id, :points
end
json.game @match.game
json.groupId @match.group_id
