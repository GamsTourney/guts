json.extract! @player, :id, :admin, :name, :steam_id, :active_tournament_id
json.url player_url(@player, format: :json)
json.steam @player.steam_data
if @tournament
  json.tournament_id @tournament.id
end
json.medals @player.medals.each do |medal|
  json.extract! medal, :id, :player_id, :name, :variant
end
