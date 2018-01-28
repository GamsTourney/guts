class Score < ApplicationRecord
  belongs_to :game
  validates :position, :value, presence: true
  validates :position, uniqueness: { scope: :game_id }
  validate :must_fit_game_structure

  def must_fit_game_structure
    unless game
      errors.add(:scores, 'Tried to create a score without a game set!')
      return false
    end

    if position < 0 or position > game.players - 1
      errors.add(:scores, 'Cannot create a position outside the game\'s player range')
      return false
    end

    if game.scores.count >= game.players
      errors.add(:scores, 'Cannot create more scores than the game\'s player limit')
      false
    end
  end

end
