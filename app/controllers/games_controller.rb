class GamesController < ApplicationController
  before_action :set_tournament, except: [:destroy]
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    @games = @tournament.games
  end

  def show
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      render :show, status: :created, location: tournament_game_url(@tournament, @game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def update
    if @game.update(game_params)
      render :show, status: :ok, location: tournament_game_url(@tournament, @game)
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
      gp = params.require(:game).permit(:name, :img_url, :scoring)
      gp[:tournament_id] = @tournament.id
      gp
    end

end
