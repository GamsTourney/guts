class Player < ApplicationRecord
  has_many :participations
  has_many :tournaments, through: :participations

  validates :name, presence: true
end
