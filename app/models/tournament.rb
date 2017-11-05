class Tournament < ApplicationRecord
  has_many :competitors
  has_many :players, through: :competitors

  validates :name, presence: true
end
