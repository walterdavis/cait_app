class ChangeNotesSize < ActiveRecord::Migration[8.0]
  def up
    change_column :orders, :notes, :string, limit: 3000
  end

  def down
    change_column :orders, :notes, :string, limit: 255
  end
end
