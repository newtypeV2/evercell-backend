class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :max_hp
      t.integer :attack_damage

      t.timestamps
    end
  end
end
