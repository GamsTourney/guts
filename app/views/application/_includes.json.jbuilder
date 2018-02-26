included = {}
@include[controller_name].keys.each do |collection|
  if allowed.include?(collection)
    included[collection] = obj.send(collection)
  end
end
json.included do
  included.each do |model, instances|
    json.set! model, instances.each do |instance|
      json.merge! instance.respond_to?(:attributes) ? instance.attributes : instance
      begin
        json.set! :url, polymorphic_url(instance)
      rescue
        # Unable to generate a URL for resource - safe
      end
    end
  end
end


