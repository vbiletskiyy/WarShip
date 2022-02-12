class User < ApplicationRecord
    has_many :games
    has_many :ships
    has_many :boards
    has_many :shots
end
