class Tournament < ApplicationRecord
  has_many :competitors
  has_many :players, through: :competitors
  has_many :matches, through: :competitors
  has_many :games, -> { distinct }, through: :matches

  validates :name, presence: true
end
