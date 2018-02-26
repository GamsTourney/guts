json.array! @tournaments.each do |tournament|
  json.extract! tournament, :id, :name, :description
  json.url tournament_url(tournament, format: :json)
  unless @include.empty?
    json.partial! 'application/includes', obj: tournament, allowed: [:players, :matches, :games, :standings]
  end
end
