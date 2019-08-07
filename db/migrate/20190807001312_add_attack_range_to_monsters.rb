class AddAttackRangeToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :attack_range, :integer
  end
end
