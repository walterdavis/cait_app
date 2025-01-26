class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.boolean :pickup, default: false
      t.string :address, limit: 1_000

      t.timestamps
    end
  end
end
