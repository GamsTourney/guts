json.array! @matches.each do |match|
  json.extract! match, :id, :game_id, :tournament_id, :score_type, :start_time, :end_time, :hidden, :score_type
  json.url match_url(match, format: :json)
  json.completed match.completed?
  json.game match.game
  json.group_id match.group_id
  unless @include.empty?
    json.partial! 'application/includes', obj: match, allowed: [:players, :results, :match_competitors]
  end
end
