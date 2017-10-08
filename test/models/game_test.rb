require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test 'should validate required params exists' do
    game = Game.new
    assert_not game.save
  end

end
