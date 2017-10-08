class Tournament < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations
  has_many :games

  validates :name, presence: true
end
