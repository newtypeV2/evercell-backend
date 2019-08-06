class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :hp
      t.integer :max_hp
      t.integer :attack_damage
      t.integer :attack_range

      t.timestamps
    end
  end
end
