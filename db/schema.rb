# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_12_210020) do
  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_products", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "color_id", null: false
    t.integer "shape_id", null: false
    t.integer "quantity", default: 1, null: false
    t.string "custom_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_custom_products_on_color_id"
    t.index ["order_id"], name: "index_custom_products_on_order_id"
    t.index ["shape_id"], name: "index_custom_products_on_shape_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paid_cents", default: 0
  end

  create_table "people", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "name"
    t.string "email"
    t.boolean "pickup", default: false
    t.string "address", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone", null: false
    t.index ["order_id"], name: "index_people_on_order_id"
  end

  create_table "shapes", force: :cascade do |t|
    t.string "name"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "customize", default: false, null: false
    t.integer "price_cents", default: 0, null: false
  end

  add_foreign_key "custom_products", "colors"
  add_foreign_key "custom_products", "orders"
  add_foreign_key "custom_products", "shapes"
  add_foreign_key "people", "orders"
end
