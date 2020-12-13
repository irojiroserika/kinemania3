class AddImageNameToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :image_name, :string
  end
end
