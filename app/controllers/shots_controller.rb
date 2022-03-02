class ShotsController < ApplicationController
  def create
    cell = Cell.find(params[:cell].fetch(:cell_id).to_i)
    cell.update(hit: true)
    game = Game.find(params[:game_id])
    board = game.boards.find_by(user_id: current_user.id)
    enemy_board = game.boards.where.not(user_id: current_user.id).first
    board.cells.where(hit: [false, nil]).order("RANDOM()").first.update(hit: true)
    if !board.cells.where(ship: true, hit: [false, nil]).exists?
        game.update(finished: true)
        return render :p2_wins
    elsif !enemy_board.cells.where(ship: true, hit: [false, nil]).exists?
        game.update(finished: true)
       return render :p1_wins
    end
    redirect_to game_url(params[:game_id]), status: :found
  end
end
