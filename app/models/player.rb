class Player < ApplicationRecord
  has_many :competitors
  has_many :tournaments, through: :competitors

  validates :name, presence: true
end
