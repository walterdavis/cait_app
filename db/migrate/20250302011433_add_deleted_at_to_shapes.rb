class AddDeletedAtToShapes < ActiveRecord::Migration[8.0]
  def change
    add_column :shapes, :deleted_at, :datetime
    add_index :shapes, :deleted_at
  end
end
