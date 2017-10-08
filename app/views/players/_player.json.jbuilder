json.extract! player, :id, :name, :steam_id, :created_at, :updated_at
json.url player_url(player, format: :json)

if @include[:tournaments]
  json.players player.tournaments, partial: 'tournaments/tournament', as: :tournament
end
