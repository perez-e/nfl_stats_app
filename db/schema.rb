# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140520213417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: true do |t|
    t.string   "height"
    t.string   "weight"
    t.string   "college"
    t.string   "number"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_url"
    t.integer  "nfl_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "players", ["position_id"], name: "index_players_on_position_id", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "season_defensive_stats", force: true do |t|
    t.integer  "year"
    t.string   "team"
    t.integer  "g"
    t.integer  "comb"
    t.integer  "solo"
    t.integer  "ast"
    t.float    "sck"
    t.float    "sfty"
    t.integer  "pdef"
    t.integer  "int"
    t.integer  "td"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "season_defensive_stats", ["player_id"], name: "index_season_defensive_stats_on_player_id", using: :btree

  create_table "season_passing_stats", force: true do |t|
    t.integer  "year"
    t.integer  "g"
    t.integer  "att"
    t.integer  "comp"
    t.float    "comp_perc"
    t.float    "att_p_g"
    t.integer  "yds"
    t.float    "avg_pass"
    t.float    "yds_p_g"
    t.integer  "td"
    t.integer  "int"
    t.string   "lng"
    t.integer  "twenty"
    t.integer  "forty"
    t.integer  "sck"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.string   "team"
  end

  add_index "season_passing_stats", ["player_id"], name: "index_season_passing_stats_on_player_id", using: :btree

  create_table "season_receiving_stats", force: true do |t|
    t.integer  "year"
    t.string   "team"
    t.integer  "g"
    t.integer  "rec"
    t.integer  "yds"
    t.float    "avg_rec"
    t.float    "yds_p_g"
    t.string   "lng"
    t.integer  "td"
    t.integer  "twenty"
    t.integer  "forty"
    t.integer  "first"
    t.integer  "fum"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "season_receiving_stats", ["player_id"], name: "index_season_receiving_stats_on_player_id", using: :btree

  create_table "season_rushing_stats", force: true do |t|
    t.integer  "year"
    t.string   "team"
    t.integer  "g"
    t.integer  "att"
    t.float    "att_p_g"
    t.integer  "yds"
    t.float    "avg_rush"
    t.float    "yds_p_g"
    t.integer  "td"
    t.string   "lng"
    t.integer  "first"
    t.integer  "twenty"
    t.integer  "forty"
    t.integer  "fum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
  end

  add_index "season_rushing_stats", ["player_id"], name: "index_season_rushing_stats_on_player_id", using: :btree

  create_table "user_players", force: true do |t|
    t.integer  "player_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_players", ["player_id"], name: "index_user_players_on_player_id", using: :btree
  add_index "user_players", ["user_id"], name: "index_user_players_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

end
