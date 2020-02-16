class PlayersController < ApplicationController
  before_action :set_tournament, only: [:index]
  before_action :set_player, only: [:show, :update, :destroy, :matches]

  def index
    @players = @tournament.players.includes('medals')
  end

  def show
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      render :show, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update
    if @player.update(player_params)
      render :show, status: :ok, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
  end

  def matches
    @matches = @player.matches
    render 'matches/index'
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :steam_id)
  end
end
