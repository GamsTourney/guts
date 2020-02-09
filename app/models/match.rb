class Match < ApplicationRecord
  has_many :match_competitors
  has_many :competitors, through: :match_competitors
  belongs_to :game
  belongs_to :tournament
  has_one_attached :result_picture
  accepts_nested_attributes_for :match_competitors

  def players
    competitors.collect(&:player)
  end

  def completed?
    match_competitors.any? { |mc| mc.points && mc.points > 0 }
  end

  def group_id
    groups = Match.where(tournament: tournament, game: game, start_time: start_time)
    if groups.length > 1
      return groups.pluck(:id).index(id)
    end
  end
end
