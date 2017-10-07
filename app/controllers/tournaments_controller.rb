class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.update(params[:id], tournament_params)
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :description)
  end

end
