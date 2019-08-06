class CreateGameMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :game_monsters do |t|
      t.integer :game_id
      t.integer :monster_id
      t.integer :x_coordinate
      t.integer :y_coordinate

      t.timestamps
    end
  end
end
