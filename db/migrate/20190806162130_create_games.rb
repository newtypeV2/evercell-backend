class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :map_id
      t.string :description
      t.boolean :started

      t.timestamps
    end
  end
end
