class Game < ApplicationRecord
    has_many :boards
    belongs_to :user
    has_many :cells
    
    def create_game(p1_name)
        self.update({:name => p1_name})
    end
end
