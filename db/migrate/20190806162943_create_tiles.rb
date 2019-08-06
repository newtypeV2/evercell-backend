class CreateTiles < ActiveRecord::Migration[5.2]
  def change
    create_table :tiles do |t|
      t.string :name
      t.boolean :passover

      t.timestamps
    end
  end
end
