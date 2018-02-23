class MatchResultsController < ApplicationController
  before_action :set_match_result, only: [:show, :update, :destroy]

  def index
    @match_results = MatchResult.all
  end

  def show
  end

  def create
    @match_result = MatchResult.new(match_result_params)

    if @match_result.save
      render :show, status: :created, location: @match_result
    else
      render json: @match_result.errors, status: :unprocessable_entity
    end
  end

  def update
    if @match_result.update(match_result_params)
      render :show, status: :ok, location: @match_result
    else
      render json: @match_result.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @match_result.destroy
  end

  private
    def set_match_result
      @match_result = MatchResult.find(params[:id])
    end

    def match_result_params
      params.require(:match_result).permit(:match_competitor_id, :position)
    end
end
