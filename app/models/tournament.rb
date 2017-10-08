class Tournament < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations

  validates :name, presence: true
end
