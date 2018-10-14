class MatchesController < ApplicationController
  before_action :set_tournament, only: [:index, :create]
  before_action :set_match, only: [:show, :update, :destroy, :score]

  def index
    @matches = @tournament.matches
  end

  def show
  end

  def create
    @match = Match.new(match_params)
    @match.tournament = @tournament

    if @match.save
      render :show, status: :created, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  def update
    if @match.update(match_params)
      render :show, status: :ok, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @match.destroy
  end

  def score
    @include[controller_name] = {
      results: true,
      players: true
    }
    player_ids = params[:order].split(',').collect(&:to_i)
    @match.submit_results(player_ids)
    render 'show'
  end

  private
  
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:game_id, :start_time)
  end
end
