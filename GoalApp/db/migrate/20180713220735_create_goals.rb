class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :description, null: false
      t.boolean :public, null: false, default: true
      t.integer :user_id, null: false
      
      t.timestamps
    end
    add_index :goals, :user_id
  end
end
