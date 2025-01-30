class CreateCustomProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :custom_products do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :color, null: false, foreign_key: true
      t.belongs_to :shape, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.string :custom_text

      t.timestamps
    end
  end
end
