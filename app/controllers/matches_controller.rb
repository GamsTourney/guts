class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy]

  def index
    @matches = Match.all
  end

  def show
  end

  def create
    @match = Match.new(match_params)

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

  private
    def set_match
      @match = Match.find(params[:id])
    end

    def match_params
      params.require(:match).permit(:game_id, :start_time)
    end
end
