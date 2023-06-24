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

ActiveRecord::Schema[7.0].define(version: 2023_06_24_011657) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "release_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_favorites_on_release_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "release_sources", force: :cascade do |t|
    t.bigint "release_id", null: false
    t.bigint "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_release_sources_on_release_id"
    t.index ["source_id"], name: "index_release_sources_on_source_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.integer "show_id"
    t.integer "year"
    t.string "result_type"
    t.string "poster_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.integer "source_id"
    t.string "source_name"
    t.string "stream_type"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watchlist_releases", force: :cascade do |t|
    t.bigint "watchlist_id", null: false
    t.bigint "release_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_watchlist_releases_on_release_id"
    t.index ["watchlist_id"], name: "index_watchlist_releases_on_watchlist_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "favorites", "releases"
  add_foreign_key "favorites", "users"
  add_foreign_key "release_sources", "releases"
  add_foreign_key "release_sources", "sources"
  add_foreign_key "watchlist_releases", "releases"
  add_foreign_key "watchlist_releases", "watchlists"
  add_foreign_key "watchlists", "users"
end
