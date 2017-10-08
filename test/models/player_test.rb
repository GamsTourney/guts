require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  test 'should validate name exists' do
    player = Player.new
    assert_not player.save
  end


end
