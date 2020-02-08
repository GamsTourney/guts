# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_18_204307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.integer "player_id"
    t.integer "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "players"
    t.string "genre"
    t.integer "max_score"
  end

  create_table "match_competitors", force: :cascade do |t|
    t.integer "match_id"
    t.integer "competitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.integer "team"
    t.integer "points", default: 0
  end

  create_table "matches", force: :cascade do |t|
    t.integer "game_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tournament_id"
    t.datetime "end_time"
    t.boolean "hidden"
    t.string "score_type"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "steam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.boolean "admin"
    t.string "password_digest"
    t.bigint "active_tournament_id"
    t.index ["active_tournament_id"], name: "index_players_on_active_tournament_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "game_id"
    t.integer "position"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "position"], name: "index_scores_on_game_id_and_position", unique: true
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "locked", default: false
  end

  add_foreign_key "players", "tournaments", column: "active_tournament_id"
end
