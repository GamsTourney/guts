json.players do
  json.array! @players.each do |player|
    json.extract! player, :id, :name, :steam_id, :created_at, :updated_at
    json.url player_url(player, format: :json)
    json.steam player.steam_data
    json.partial! 'application/includes', obj: player, allowed: [:matches, :tournaments]
  end
end
