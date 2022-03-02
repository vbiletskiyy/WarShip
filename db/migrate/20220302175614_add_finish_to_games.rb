class AddFinishToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :finished, :boolean, default: false
  end
end
