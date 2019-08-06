class AddColumnToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :name, :string
  end
end
