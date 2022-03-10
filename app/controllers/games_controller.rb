class GamesController < ApplicationController
  def index
    render :index
  end

  def create
    if @game = Game.where(user: current_user, finished: false).last
      @board = @game.boards.first
    else
      @game = Game.create(user: current_user)
      @board = Board.create(user: current_user, game: @game)
      Cell.create_grid(@game.id, @board.id, current_user.id)
      enemy = User.create(name: Faker::Name.name, password: "W23E4r")
      enemy_board = Board.create(user: enemy, game: @game)
      Cell.create_grid(@game.id, enemy_board.id, enemy.id)
      enemy_board.pick_random
    end
    redirect_to board_url(@board), status: :found
  end
 
  def show
    @player_id = current_user.id
    @user = current_user
    @game = Game.find(params["id"])
    board = @game.boards.find_by(user_id: @player_id)
    @cells = board.cells
    enemy_board = @game.boards.where.not(user_id: @player_id).first
    @enemy_cells = enemy_board.cells
    @enemy_name = enemy_board.user.name
  end
end
