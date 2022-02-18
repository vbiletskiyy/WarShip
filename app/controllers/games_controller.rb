class GamesController < ApplicationController
  def index
    render :index
  end
  
  def new
    @game = Game.create(user: current_user)
    @board = Board.create(user: current_user, game: @game)

    Cell.create_grid(@game.id, @board.id)
    render :index
  end

end

