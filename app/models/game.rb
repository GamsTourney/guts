class Game < ApplicationRecord
  belongs_to :tournament

  validates :name, presence: true
  validates :scoring, presence: true
end
