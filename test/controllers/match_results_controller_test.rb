require 'test_helper'

class MatchResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @match_result = match_results(:one)
  end

  test "should get index" do
    get match_results_url, as: :json
    assert_response :success
  end

  test "should create match_result" do
    assert_difference('MatchResult.count') do
      post match_results_url, params: { match_result: { match_competitor_id: @match_result.match_competitor_id, position: @match_result.position } }, as: :json
    end

    assert_response 201
  end

  test "should show match_result" do
    get match_result_url(@match_result), as: :json
    assert_response :success
  end

  test "should update match_result" do
    patch match_result_url(@match_result), params: { match_result: { match_competitor_id: @match_result.match_competitor_id, position: @match_result.position } }, as: :json
    assert_response 200
  end

  test "should destroy match_result" do
    assert_difference('MatchResult.count', -1) do
      delete match_result_url(@match_result), as: :json
    end

    assert_response 204
  end
end
