class AddDirectionToCharacterGame < ActiveRecord::Migration[5.2]
  def change
    add_column :character_games, :direction, :string, default: "right"
  end
end
