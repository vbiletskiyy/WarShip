class Board < ApplicationRecord
    has_many :ship
    has_many :shot
    belongs_to :user
    belongs_to :game
end
