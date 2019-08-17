class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :body

      t.timestamps
    end
  end
end
