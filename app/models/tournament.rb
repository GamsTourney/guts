class Tournament < ApplicationRecord
  has_many :competitors
  has_many :players, -> { distinct }, through: :competitors
  has_many :matches, -> { distinct }, through: :competitors
  has_many :games, -> { distinct }, through: :matches

  validates :name, presence: true
end
