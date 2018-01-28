unless @include.empty?
  included = {}
  @include[controller_name].keys.each do |collection|
    if allowed.include?(collection)
      included[collection] = obj.send(collection)
    end
  end
  json.included included
end