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

end
