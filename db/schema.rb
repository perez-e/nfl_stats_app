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

ActiveRecord::Schema.define(version: 20140203182900) do

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "height"
    t.string   "weight"
    t.string   "college"
    t.string   "number"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_url"
  end

  add_index "players", ["position_id"], name: "index_players_on_position_id"

  create_table "positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  add_index "season_passing_stats", ["player_id"], name: "index_season_passing_stats_on_player_id"

end
