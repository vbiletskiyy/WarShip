class GamesController < ApplicationController
  def index
    render :index
  end
  
  def new
    @number = []
    @player_id = current_user.id

    if @game = Game.where(user: current_user).last
      @board = @game.boards.first
      @cells = @board.cells
    else
      @game = Game.create(user: current_user)
      @board = Board.create(user: current_user, game: @game)
      Cell.create_grid(@game.id, @board.id, current_user.id)
      @cells = @board.cells
    end
  end
end

