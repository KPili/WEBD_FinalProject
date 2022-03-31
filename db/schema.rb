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

ActiveRecord::Schema[7.0].define(version: 2022_03_31_232253) do
  create_table "grind_types", force: :cascade do |t|
    t.string "grind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "inventories", "suppliers"
  add_foreign_key "inventory_details", "inventories"
  add_foreign_key "inventory_details", "species"
  add_foreign_key "suppliers", "jobs"
end
