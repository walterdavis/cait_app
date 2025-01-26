class CreateCustomProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :custom_products do |t|
      t.references :person, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.references :shape, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.string :custom_text

      t.timestamps
    end
  end
end
