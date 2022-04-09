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

ActiveRecord::Schema[7.0].define(version: 2022_04_09_160259) do
  create_table "employees", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.string "phone_num"
    t.string "email"
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_employees_on_job_id"
  end

  create_table "grind_types", force: :cascade do |t|
    t.string "grind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "desc"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "item_name"
    t.float "unit_sold"
    t.float "unit_price"
    t.integer "stock_amount"
    t.boolean "new_inventory"
    t.float "total"
    t.float "retail_total"
    t.integer "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_inventories_on_supplier_id"
  end

  create_table "inventory_details", force: :cascade do |t|
    t.float "aroma"
    t.float "flavor"
    t.float "acidity"
    t.string "country_of_origin"
    t.boolean "on_sale"
    t.integer "inventory_id", null: false
    t.integer "species_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_inventory_details_on_inventory_id"
    t.index ["species_id"], name: "index_inventory_details_on_species_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_title"
    t.text "job_desc"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_histories", force: :cascade do |t|
    t.date "order_date"
    t.float "cart_total"
    t.float "tax_rate"
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_histories_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_num"
    t.string "email"
    t.float "cart_total"
    t.integer "employee_id", null: false
    t.integer "grind_type_id", null: false
    t.integer "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_orders_on_employee_id"
    t.index ["grind_type_id"], name: "index_orders_on_grind_type_id"
    t.index ["province_id"], name: "index_orders_on_province_id"
  end

  create_table "province_tax_rates", force: :cascade do |t|
    t.integer "province_id", null: false
    t.integer "tax_rate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_province_tax_rates_on_province_id"
    t.index ["tax_rate_id"], name: "index_province_tax_rates_on_tax_rate_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "province_code"
    t.string "province_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company_name"
    t.string "company_rep"
    t.string "email"
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_suppliers_on_job_id"
  end

  create_table "tax_rates", force: :cascade do |t|
    t.float "gst"
    t.float "pst"
    t.float "hst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "jobs"
  add_foreign_key "inventories", "suppliers"
  add_foreign_key "inventory_details", "inventories"
  add_foreign_key "inventory_details", "species"
  add_foreign_key "order_histories", "orders"
  add_foreign_key "orders", "employees"
  add_foreign_key "orders", "grind_types"
  add_foreign_key "orders", "provinces"
  add_foreign_key "province_tax_rates", "provinces"
  add_foreign_key "province_tax_rates", "tax_rates"
  add_foreign_key "suppliers", "jobs"
end
