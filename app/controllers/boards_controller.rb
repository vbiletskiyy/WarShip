class BoardsController < ApplicationController
  def show
    @player_id = current_user.id
    @board = Board.find(params["id"])
    @cells = @board.cells
    @game = @board.game
    @number = @cells.where(player: current_user.id, ship: true)
  end
end
