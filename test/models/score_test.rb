require 'test_helper'

class ScoreTest < ActiveSupport::TestCase

  setup do
    @single = games(:single)
  end


  test 'should validate required params exists' do
    score = Score.new
    assert_not score.save
  end

  test 'should accept a score for a game' do
    game = Game.new(players: 1)
    s1 = Score.new(game: game, position: 0, value: 5)
    assert s1.save
  end

  test 'should reject a score when a game already has all scores defined' do
    score = Score.new(game: @single, position: 0, value: 5)
    assert_not score.save
  end

  test 'should reject an invalid position for a game' do
    game = Game.new(players: 2)
    s1 = Score.new(game: game, position: 5, value: 5)
    assert_not s1.save
  end

end
