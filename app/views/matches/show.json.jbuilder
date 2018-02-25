json.extract! @match, :id, :game_id, :tournament_id, :start_time, :end_time
json.url match_url(@match, format: :json)
json.player_ids @match.player_ids
unless @include.empty?
  json.partial! 'application/includes', obj: @match, allowed: [:players, :results]
end
