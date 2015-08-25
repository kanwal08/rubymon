class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :power
      
      t.references :user
      t.references :monster_type
      t.references :team
      
      t.timestamps
    end
  end
end
