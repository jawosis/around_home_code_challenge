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

ActiveRecord::Schema.define(version: 2021_11_21_092524) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "operating_radius_in_km"
    t.decimal "avg_rating", precision: 3, scale: 2, default: "0.0"
    t.float "latitude"
    t.float "longitude"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "partners_products", force: :cascade do |t|
    t.integer "partner_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_id"], name: "index_partners_products_on_partner_id"
    t.index ["product_id"], name: "index_partners_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id"
    t.integer "material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["material_id"], name: "index_products_on_material_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "partner_id"
    t.integer "product_id"
    t.integer "category_id"
    t.float "size_in_qm"
    t.float "latitude"
    t.float "longitude"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["customer_id"], name: "index_projects_on_customer_id"
    t.index ["partner_id"], name: "index_projects_on_partner_id"
    t.index ["product_id"], name: "index_projects_on_product_id"
  end

end
