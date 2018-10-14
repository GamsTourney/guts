require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament = tournaments(:one)
    @player = players(:one)
  end

  test "should get index" do
    get tournament_players_url(@tournament), as: :json
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post players_url, params: { player: { name: @player.name, steam_id: @player.steam_id } }, as: :json
    end

    assert_response 201
  end

  test "should show player" do
    get player_url(@player), as: :json
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { name: @player.name, steam_id: @player.steam_id } }, as: :json
    assert_response 200
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player), as: :json
    end

    assert_response 204
  end
end
