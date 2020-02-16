class Tournament < ApplicationRecord
  has_many :competitors
  has_many :matches
  has_many :match_competitors, through: :competitors
  has_many :players, -> { distinct }, through: :competitors
  has_many :games, -> { distinct }, through: :matches

  validates :name, presence: true

  def reset
    if locked
      raise 'Tournament is locked! You must unlock the tournament to reset.'
    end

    matches.each do |m|
      m.result_picture.purge
      m.match_competitors.each do |mc|
        mc.update(position: nil, points: 0)
      end
    end
  end

  def standings
    standings_collection = []
    players.each do |player|
      avatar = nil
      if player.steam_data
        avatar = player.steam_data['avatar']
      end
      player_id = player.id
      standings_collection << {
        id: "#{id}:#{player_id}",
        score: player.score(self),
        name: player.name.split(' ').first,
        avatar: avatar,
        player_id: player_id,
        tournament_id: id
      }
    end
    standings_collection
  end
end
