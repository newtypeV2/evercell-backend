class CreateMapTiles < ActiveRecord::Migration[5.2]
  def change
    create_table :map_tiles do |t|
      t.integer :map_id
      t.integer :tile_id
      t.integer :x_coordinate
      t.integer :y_coordinate

      t.timestamps
    end
  end
end
