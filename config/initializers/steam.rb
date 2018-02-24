SteamWebApi.configure do |config|
  config.api_key = ENV['STEAM_API_KEY']
end

class SteamCache

  @@cache = {}
  TTL = 10.minutes

  def self.get_player_summary(id)
    if @@cache[id] && @@cache[id][:cache_time] > TTL.ago
      return @@cache[id]
    end

    player = SteamWebApi::Player.new(id)
    @@cache[id] = player.summary.profile
    if @@cache[id]
      @@cache[id][:cache_time] = Time.current
    end
    @@cache[id]
  end

end
