class Match < ApplicationRecord
  has_many :match_competitors
  has_many :competitors, through: :match_competitors
  belongs_to :game

  def players
    competitors.collect(&:player)
  end
end
