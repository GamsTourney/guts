class MatchesController < ApplicationController
  before_action :set_tournament, only: [:index, :create]
  before_action :set_match, only: [:show, :update, :destroy, :match_competitors, :attach_picture]

  def index
    @matches = @tournament.matches.includes('match_competitors')
  end

  def show
  end

  def create
    @match = Match.new(match_params)
    @match.tournament = @tournament

    if @match.save
      json = render :show, status: :ok, location: @match
      ActionCable.server.broadcast 'matches_channel', json
      json
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  def update
    if @match.update(match_params)
      json = render :show, status: :ok, location: @match
      ActionCable.server.broadcast 'matches_channel', json
      json
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @match.destroy
  end

  def match_competitors
  end

  def attach_picture
    picture = params[:result_picture]
    @match.result_picture.attach(picture)
    json = render :show, status: :ok, location: @match
    ActionCable.server.broadcast 'matches_channel', json
    json
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit!
  end
end
