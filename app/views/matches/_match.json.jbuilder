json.extract! match, :id, :game_id, :start_time, :created_at, :updated_at
json.url match_url(match, format: :json)

if @include[:players]
  json.players match.players, partial: 'players/player', as: :player
end
