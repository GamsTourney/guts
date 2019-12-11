json.extract! @player, :id, :name, :steam_id, :active_tournament_id
json.url player_url(@player, format: :json)
json.steam @player.steam_data
