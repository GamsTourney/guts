require 'test_helper'

class TournamentsControllerTest < ActionDispatch::IntegrationTest

  test 'attempt to load all tournaments' do
    get '/tournaments'
    assert_response :success
  end

  test 'attempt to create a valid tournament' do
    post '/tournaments', params: { tournament: { name: 'test tourney', description: 'simple desc' } }
    assert_response :created
  end

  test 'attempt to create an invalid tournament' do
    post '/tournaments', params: { tournament: { food: 'bar' } }
    assert_response :unprocessable_entity
  end

end
