json.array! @match.match_competitors.each do |mc|
  json.extract! mc, :id, :match_id, :competitor_id, :position, :team, :player_id, :points
  unless @include.empty?
    json.partial! 'application/includes', obj: match, allowed: [:player]
  end
end
