json.extract! tournament, :name, :description, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
json.partial! 'application/includes', obj: tournament, allowed: [:players, :matches, :games]