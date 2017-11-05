class Player < ApplicationRecord
  has_many :competitors
  has_many :tournaments, through: :competitors

  validates :name, presence: true

  def matches(tournament)
    return competitors.where(tournament: tournament).collect(&:matches)
  end
end
