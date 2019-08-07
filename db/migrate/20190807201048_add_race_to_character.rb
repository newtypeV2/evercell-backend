class AddRaceToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :race, :string
  end
end
