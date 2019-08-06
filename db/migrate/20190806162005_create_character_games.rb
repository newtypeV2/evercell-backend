class CreateCharacterGames < ActiveRecord::Migration[5.2]
  def change
    create_table :character_games do |t|
      t.integer :character_id
      t.integer :game_id
      t.integer :x_coordinate
      t.integer :y_coordinate
      t.integer :hp
      t.integer :max_hp

      t.timestamps
    end
  end
end
