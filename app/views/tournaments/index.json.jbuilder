json.array! @tournaments.each do |tournament|
  json.extract! tournament, :id, :name, :description, :locked
  json.url tournament_url(tournament, format: :json)
end
