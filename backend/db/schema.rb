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

ActiveRecord::Schema[7.0].define(version: 2023_06_20_103014) do
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

  create_table "releases", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.integer "tmdb_id"
    t.string "tmdb_type"
    t.string "imdb_id"
    t.integer "season_number"
    t.string "poster_url"
    t.date "source_release_date"
    t.integer "source_id"
    t.string "source_name"
    t.boolean "is_original"
    t.bigint "watchlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["watchlist_id"], name: "index_releases_on_watchlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "favorites", "releases"
  add_foreign_key "favorites", "users"
  add_foreign_key "releases", "watchlists"
  add_foreign_key "watchlists", "users"
end
