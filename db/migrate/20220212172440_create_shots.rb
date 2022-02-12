class CreateShots < ActiveRecord::Migration[7.0]
  def change
    create_table :shots do |t|
      t.integer :user_id
      t.integer :board_id
      t.timestamps
    end
  end
end
