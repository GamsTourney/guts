json.array! @players.each do |player|
  json.extract! player, :id, :admin, :name, :steam_id
  json.url player_url(player, format: :json)
  json.steam player.steam_data
  if @tournament
    json.tournament_id @tournament.id
  end
end
