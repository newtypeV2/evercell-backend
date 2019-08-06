class AddColumnsToGameMonster < ActiveRecord::Migration[5.2]
  def change
    add_column :game_monsters, :hp, :integer
    add_column :game_monsters, :max_hp, :integer
  end
end
