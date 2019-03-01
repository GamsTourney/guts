json.extract! @match, :id, :game_id, :tournament_id, :score_type, :start_time, :end_time, :hidden
json.url match_url(@match, format: :json)
json.completed @match.completed?
json.game @match.game
unless @include.empty?
  json.partial! 'application/includes', obj: @match,
  allowed: [:players, :results, :game]
end
