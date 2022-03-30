class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @location = Location.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render "new"
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render "new"
    end
  end

  def delete
    @game = Game.find(params[:id])
    @game.delete
  end

  private

  def game_params
    params.require(:game).permit(:sport_id, :creator_id, :description, :location_id, :date, :capacity, :status, :title)
  end
end
