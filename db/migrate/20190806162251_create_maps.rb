class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :name
      t.integer :x_map_size
      t.integer :y_map_size

      t.timestamps
    end
  end
end
