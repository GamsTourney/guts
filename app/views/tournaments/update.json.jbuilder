if @tournament.errors.empty?
  json.data @tournament
else
  json.errors @tournament.errors
end
