class CreateColors < ActiveRecord::Migration[8.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
