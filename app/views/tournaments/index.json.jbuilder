json.array! @tournaments.each do |tournament|
  json.extract! tournament, :id, :name, :description, :created_at, :updated_at
  json.url tournament_url(tournament, format: :json)
  unless @include.empty?
    json.partial! 'application/includes', obj: tournament, allowed: [:players, :matches, :games]
  end
end
