class CreateCells < ActiveRecord::Migration[7.0]
  def change
    create_table :cells do |t|
      t.integer "x"
      t.integer "y"
      t.boolean "ship"
      t.integer "player"
      t.boolean "hit"
      t.integer "game_id"
      t.integer "board_id"
  
      t.timestamps
    end
  end
end
