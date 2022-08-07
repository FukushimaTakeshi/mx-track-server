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

ActiveRecord::Schema.define(version: 2022_04_05_133452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "current_vehicles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "user_vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_current_vehicles_on_user_id"
    t.index ["user_vehicle_id"], name: "index_current_vehicles_on_user_vehicle_id"
  end

  create_table "maintenance_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maintenance_menu_category_orders", force: :cascade do |t|
    t.bigint "maintenance_menu_id", null: false
    t.bigint "maintenance_category_id", null: false
    t.integer "order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maintenance_category_id"], name: "index_menu_category_orders_on_maintenance_category"
    t.index ["maintenance_menu_id", "maintenance_category_id"], name: "index_maintenance_menu_category_orders", unique: true
    t.index ["maintenance_menu_id"], name: "index_menu_category_orders_on_maintenance_menu_id"
  end

  create_table "maintenance_menu_records", force: :cascade do |t|
    t.bigint "maintenance_record_id", null: false
    t.bigint "maintenance_menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maintenance_menu_id"], name: "index_maintenance_menu_records_on_maintenance_menu_id"
    t.index ["maintenance_record_id"], name: "index_maintenance_menu_records_on_maintenance_record_id"
  end

  create_table "maintenance_menus", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "maintenance_category_id"
    t.index ["maintenance_category_id"], name: "index_maintenance_menus_on_maintenance_category_id"
  end

  create_table "maintenance_records", force: :cascade do |t|
    t.date "maintenance_on", null: false
    t.integer "operation_time", null: false
    t.text "memo"
    t.bigint "maintenance_menu_id", null: false
    t.bigint "user_vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maintenance_menu_id"], name: "index_maintenance_records_on_maintenance_menu_id"
    t.index ["user_vehicle_id"], name: "index_maintenance_records_on_user_vehicle_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_models_on_brand_id"
  end

  create_table "off_road_tracks", force: :cascade do |t|
    t.string "name"
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prefecture_id"], name: "index_off_road_tracks_on_prefecture_id"
  end

  create_table "periodic_maintenances", force: :cascade do |t|
    t.integer "cycle_time", default: 0, null: false
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_vehicle_id", null: false
    t.bigint "maintenance_menu_id", null: false
    t.index ["maintenance_menu_id"], name: "index_periodic_maintenances_on_maintenance_menu_id"
    t.index ["user_vehicle_id"], name: "index_periodic_maintenances_on_user_vehicle_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "practice_records", force: :cascade do |t|
    t.date "practice_date", null: false
    t.text "memo"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "off_road_track_id", null: false
    t.integer "practice_time", default: 0, null: false
    t.bigint "user_vehicle_id"
    t.index ["off_road_track_id"], name: "index_practice_records_on_off_road_track_id"
    t.index ["user_id"], name: "index_practice_records_on_user_id"
    t.index ["user_vehicle_id"], name: "index_practice_records_on_user_vehicle_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.integer "code", null: false
    t.string "name", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_prefectures_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "user_vehicles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "initial_time", default: 0, null: false
    t.index ["user_id"], name: "index_user_vehicles_on_user_id"
    t.index ["vehicle_id"], name: "index_user_vehicles_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "photo_url"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "model_id", null: false
    t.index ["model_id"], name: "index_vehicles_on_model_id"
  end

  add_foreign_key "current_vehicles", "user_vehicles"
  add_foreign_key "current_vehicles", "users"
  add_foreign_key "maintenance_menu_category_orders", "maintenance_categories"
  add_foreign_key "maintenance_menu_category_orders", "maintenance_menus"
  add_foreign_key "maintenance_menu_records", "maintenance_menus"
  add_foreign_key "maintenance_menu_records", "maintenance_records"
  add_foreign_key "maintenance_menus", "maintenance_categories"
  add_foreign_key "maintenance_records", "maintenance_menus"
  add_foreign_key "maintenance_records", "user_vehicles"
  add_foreign_key "models", "brands"
  add_foreign_key "off_road_tracks", "prefectures"
  add_foreign_key "periodic_maintenances", "maintenance_menus"
  add_foreign_key "periodic_maintenances", "user_vehicles"
  add_foreign_key "practice_records", "off_road_tracks"
  add_foreign_key "practice_records", "user_vehicles"
  add_foreign_key "practice_records", "users"
  add_foreign_key "prefectures", "regions"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "user_vehicles", "users"
  add_foreign_key "user_vehicles", "vehicles"
  add_foreign_key "vehicles", "models"
end
