class AddNotesToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :notes, :string
  end
end
