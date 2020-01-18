json.array! @standings do |standing|
  json.extract! standing, :id, :avatar, :name, :score, :player_id, :tournament_id
end
