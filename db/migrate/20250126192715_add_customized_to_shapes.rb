class AddCustomizedToShapes < ActiveRecord::Migration[8.0]
  def change
    add_column :shapes, :customize, :boolean, null: false, default: false
  end
end
