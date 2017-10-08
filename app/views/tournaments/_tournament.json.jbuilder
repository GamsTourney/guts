json.extract! tournament, :name, :description, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)

if @include[:players]
  json.players tournament.players, partial: 'players/player', as: :player
end
