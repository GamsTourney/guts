class GamesController < ApplicationController
  before_action :set_tournament, except: [:show, :create, :scores]
  before_action :set_game, only: [:show, :update, :destroy, :scores]

  def index
    @games = @tournament.games.includes('scores')
  end

  def show
  end

  def matches
    @matches = Match.where(
      tournament_id: params[:tournament_id],
      game_id: params[:id]
    ).all
    render 'matches/index'
  end

  def scores
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      render :show, status: :created, location: game_url(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def update
    if @game.update(game_params)
      render :show, status: :ok, location: game_url(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :img_url, :players)
  end
end
