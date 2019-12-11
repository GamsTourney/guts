json.extract! @match, :id, :game_id, :tournament_id, :score_type, :start_time, :end_time, :hidden
json.url match_url(@match, format: :json)
json.completed @match.completed?
json.match_competitors @match.match_competitors
json.game @match.game
