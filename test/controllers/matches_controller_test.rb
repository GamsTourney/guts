require 'test_helper'

class MatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament = tournaments(:one)
    @match = matches(:one)
  end

  test "should get index" do
    get tournament_matches_url(@tournament), as: :json
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post tournament_matches_url(@tournament), params: { match: { game_id: @match.game_id, start_time: @match.start_time } }, as: :json
    end

    assert_response 201
  end

  test "should show match" do
    get match_url(@match), as: :json
    assert_response :success
  end

  test "should update match" do
    patch match_url(@match), params: { match: { game_id: @match.game_id, start_time: @match.start_time } }, as: :json
    assert_response 200
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete match_url(@match), as: :json
    end

    assert_response 204
  end
end
