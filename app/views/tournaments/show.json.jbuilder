json.extract! @tournament, :id, :name, :description, :locked
json.url tournament_url(@tournament, format: :json)
