class GamesController < ApplicationController
  before_action :find_game, only: [:show, :update]
  def index
    games = Game.all
    render json: games
  end

  def show
    render json: @game
  end

  def create
    game = Game.create(game_params)
    render json: game
  end

  def update
    @game.update(game_params)
    render json: @game
  end

private

def game_params
  params.permit(state: [])
end

def find_game
  @game = Game.find(params[:id])
end
end
