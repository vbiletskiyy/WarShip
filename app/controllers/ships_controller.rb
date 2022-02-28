class ShipsController < ApplicationController
  def create
    @board = Board.find(params["board_id"])
    @cells = @board.cells
    @cell = @cells.find(params[:cell].fetch(:cell_id).to_i)
    @cell.update(ship: params[:cell].fetch(:ship))
    redirect_to board_url(@board), status: :found
  end
end
