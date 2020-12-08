class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :cast_id
      t.integer :appear_id

      t.timestamps
    end
    
    add_index :relationships, :cast_id
    add_index :relationships, :appear_id
    add_index :relationships, [:cast_id, :appear_id], unique: true
  end
end
