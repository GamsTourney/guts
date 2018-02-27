json.array! @matches.each do |match|
  json.extract! match, :id, :game_id, :tournament_id, :start_time, :end_time, :hidden
  json.url match_url(match, format: :json)
  json.game match.game
  json.player_ids match.player_ids
  unless @include.empty?
    json.partial! 'application/includes', obj: match, allowed: [:players, :results]
  end
end

