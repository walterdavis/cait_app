class AddDeletedAtToColors < ActiveRecord::Migration[8.0]
  def change
    add_column :colors, :deleted_at, :datetime
    add_index :colors, :deleted_at
  end
end
