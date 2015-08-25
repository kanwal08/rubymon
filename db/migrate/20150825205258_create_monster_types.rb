class CreateMonsterTypes < ActiveRecord::Migration
  def change
    create_table :monster_types do |t|
      t.string :name
      t.integer :strength_id
      t.integer :weakness_id
      
      t.timestamps
    end
  end
end
