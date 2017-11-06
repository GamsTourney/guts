class Player < ApplicationRecord
  has_many :competitors
  has_many :tournaments, through: :competitors
  has_many :matches, -> { distinct }, through: :tournaments

  validates :name, presence: true
end
