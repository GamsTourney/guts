class Score < ApplicationRecord
  belongs_to :game
  validates :position, :value, presence: true
  validates :position, uniqueness: { scope: :game_id }
end
