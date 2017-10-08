require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament = tournaments(:one)
    @game = games(:one)
  end

  test "should get index" do
    get tournament_games_url(@tournament), as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post tournament_games_url(@tournament), params: { tournament_id: @tournament.id, game: { name: @game.name, scoring: @game.scoring } }, as: :json
    end

    assert_response 201
  end

  test "should show game" do
    get tournament_game_url(@tournament, @game), as: :json
    assert_response :success
  end

  test "should update game" do
    patch tournament_game_url(@tournament, @game), params: { tournament_id: @tournament.id, game: { name: @game.name, scoring: @game.scoring } }, as: :json
    assert_response 200
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete tournament_game_url(@tournament, @game), as: :json
    end

    assert_response 204
  end
end
