require 'test_helper'

class TournamentTest < ActiveSupport::TestCase

  test 'should validate name exists' do
    tournament = Tournament.new
    assert_not tournament.save
  end

end
