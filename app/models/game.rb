class Game < ApplicationRecord
  has_many :scores
  has_many :matches
  validates :name, presence: true
  validates :players, presence: true
end
