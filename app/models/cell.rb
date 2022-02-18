class Cell < ApplicationRecord
    belongs_to :game
    belongs_to :board
    def self.create_grid(game_id, board_id)
        a = [1,2,3,4,5] #number of rows To change gameboard size
        b = [1,2,3,4,5] #number of columns To change gameboard size
        c = [1,2] #number of players
        a.each do |n|
          b.each do |m|
            c.each do |o|
              Cell.create({x:(m), y:(n), player:(o), ship: false, game_id: game_id, board_id: board_id})
            end
          end
        end
      end
end
