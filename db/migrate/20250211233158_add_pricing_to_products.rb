class AddPricingToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :shapes, :price_cents, :integer, null: false, default: 0
    add_column :orders, :paid_cents, :integer, default: 0
  end
end
