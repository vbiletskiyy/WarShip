class Board < ApplicationRecord
  has_many :ships
  has_many :shots
  belongs_to :user
  belongs_to :game 
  has_many :cells

  def pick_random
    cells
    .where(ship: false)
    .order("RANDOM()")
    .limit(7)
    .update_all(ship: true)
  end
end
