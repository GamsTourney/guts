class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :update, :destroy, :scores]

  def index
    @scores = Score.all
  end

  def show
  end

  private

  def set_score
    @score = Score.find(params[:id])
  end

end
