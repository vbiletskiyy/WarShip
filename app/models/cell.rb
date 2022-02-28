class Cell < ApplicationRecord
  belongs_to :game
  belongs_to :board

  def self.create_grid(game_id, board_id, user_id)
    (1..5).each do |n|
      (1..5).each do |m|
        Cell.create(x: m, y: n, ship: false, game_id: game_id, board_id: board_id, player: user_id)
      end
    end
  end

  def self.pick_random
    7.times() do 
      d = @enemy_board.cells.where(player: nil, ship: false).order("RANDOM()").first
      d.ship = true
      d.save
    end
  end
end
