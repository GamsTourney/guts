require 'test_helper'

class MatchTest < ActiveSupport::TestCase

  setup do
    @match = matches(:one)
  end

  test 'should validate required params exists' do
    match = Match.new
    assert_not match.save
  end

  test 'should be able to reference a set of players' do
    players = @match.players
    assert players.size == 1
  end

  test 'should return the scores of it\'s parent game' do
    game = Game.new(players: 1)
    Score.new(game: game, position: 0, value: 5)
    match = Match.new(game: game)
    assert match.scores == game.scores
  end

end
