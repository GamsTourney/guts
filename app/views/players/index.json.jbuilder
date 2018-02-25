json.array! @players.each do |player|
  json.extract! player, :id, :name, :steam_id
  json.url player_url(player, format: :json)
  json.steam player.steam_data
  unless @include.empty?
    json.partial! 'application/includes', obj: player, allowed: [:matches, :tournaments]
  end
end
