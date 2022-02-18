class Board < ApplicationRecord
    has_many :ships
    has_many :shots
    belongs_to :user
    belongs_to :game
end
