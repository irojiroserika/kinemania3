class CreateContentActors < ActiveRecord::Migration[6.0]
  def change
    create_table :content_actors do |t|
      t.references :actor, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
