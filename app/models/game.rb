class Game < ApplicationRecord
  validates :name, presence: true
  validates :scoring, presence: true
end
