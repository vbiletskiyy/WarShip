class Cell < ApplicationRecord\
    belongs_to :game
    belongs_to :board
end
