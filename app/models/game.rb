class Game < ApplicationRecord
    has_many :boards
    belongs_to :user
end
