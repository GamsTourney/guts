class MatchesController < ApplicationController
  before_action :set_tournament, only: [:index, :create]
  before_action :set_match, only: [:show, :update, :destroy, :score, :match_competitors]

  def index
    @matches = @tournament.matches.includes('match_competitors')
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
    scores = JSON.parse(params[:scores])
    @match.submit_results(scores)
    render 'show'
  end

  def match_competitors
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
