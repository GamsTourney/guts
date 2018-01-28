json.extract! player, :id, :name, :steam_id, :created_at, :updated_at
json.url player_url(player, format: :json)
json.partial! 'application/includes', obj: player, allowed: [:matches, :tournaments]
json.steam player.steam_data