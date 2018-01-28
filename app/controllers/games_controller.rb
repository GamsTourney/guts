class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
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

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      return params.require(:game).permit(:name, :img_url, :players)
    end

end
