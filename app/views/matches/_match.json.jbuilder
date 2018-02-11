json.extract! match, :id, :game_id, :start_time, :created_at, :updated_at
json.url match_url(match, format: :json)
json.partial! 'application/includes', obj: match, allowed: [:players]
