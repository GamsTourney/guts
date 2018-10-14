class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :update, :destroy, :stats]

  def index
    @tournaments = Tournament.all
  end

  def show
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      render :show, status: :created, location: @tournament
    else
      render json: @tournament.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tournament.update(tournament_params)
      render :show, status: :ok, location: @tournament
    else
      render json: @tournament.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tournament.destroy
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit(:name, :description)
  end
end
