json.array! @games.each do |game|
  json.extract! game, :id, :name, :img_url, :players
  json.url game_url(game, format: :json)
  unless @include.empty?
    json.partial! 'application/includes', obj: game, allowed: [:scores]
  end
end
