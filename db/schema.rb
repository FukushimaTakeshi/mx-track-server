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

ActiveRecord::Schema.define(version: 2021_07_10_104950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "off_road_tracks", force: :cascade do |t|
    t.string "name"
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prefecture_id"], name: "index_off_road_tracks_on_prefecture_id"
  end

  create_table "practice_records", force: :cascade do |t|
    t.date "practice_date", null: false
    t.integer "hours", default: 0, null: false
    t.integer "minutes", default: 0, null: false
    t.text "memo"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "off_road_track_id", null: false
    t.index ["off_road_track_id"], name: "index_practice_records_on_off_road_track_id"
    t.index ["user_id"], name: "index_practice_records_on_user_id"
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

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "off_road_tracks", "prefectures"
  add_foreign_key "practice_records", "off_road_tracks"
  add_foreign_key "practice_records", "users"
  add_foreign_key "prefectures", "regions"
end
