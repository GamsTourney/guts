require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  setup do
    @tournament = tournaments(:one)
    @player = players(:one)
  end

  test 'should validate name exists' do
    player = Player.new
    assert_not player.save
  end

  test 'should be able to retrieve matches for a tournament' do
    matches = @player.matches(@tournament)
    assert matches.size == 1
  end


end
