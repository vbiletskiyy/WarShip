class GamesController < ApplicationController
  def index
    render :index
  end
  
  def create
    if @game = Game.where(user: current_user).last
      @board = @game.boards.first
    else
      @game = Game.create(user: current_user)
      @board = Board.create(user: current_user, game: @game)
      Cell.create_grid(@game.id, @board.id, current_user.id)
    end
    redirect_to board_url(@board), status: :found
  end
end

