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
      @enemy_board = Cell.create_grid(@game.id, @board.id, nil)
    end
    redirect_to board_url(@board), status: :found
  end
 
  def show
    @player_id = current_user.id
    @user = current_user
    @game=  Game.find(params["id"])
    @cells = @game.cells
    @comp_name = Faker::Name.name
  end
end
