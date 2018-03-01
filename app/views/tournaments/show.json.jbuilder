json.extract! @tournament, :id, :name, :description
json.url tournament_url(@tournament, format: :json)
json.stats @tournament.gather_stats
unless @include.empty?
  json.partial! 'application/includes', obj: @tournament, allowed: [:players, :matches, :games, :standings]
end
