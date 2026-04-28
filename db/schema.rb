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

ActiveRecord::Schema[8.1].define(version: 2026_03_30_033838) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "event_id"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "end"
    t.string "name"
    t.datetime "start"
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "aliases"
    t.datetime "created_at", null: false
    t.float "lat"
    t.bigint "locatable_id"
    t.string "locatable_type"
    t.float "lon"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable"
    t.index ["name"], name: "index_locations_on_name"
  end

  create_table "people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "discord_id"
    t.integer "grad_year"
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["name", "username"], name: "index_people_on_name_and_username"
  end
end
