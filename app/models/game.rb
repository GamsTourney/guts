class Game < ApplicationRecord
  has_many :scores
  validates :name, presence: true
  validates :players, presence: true
end
