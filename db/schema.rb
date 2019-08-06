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

ActiveRecord::Schema.define(version: 2019_08_06_162943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_games", force: :cascade do |t|
    t.integer "character_id"
    t.integer "game_id"
    t.integer "x_coordinate"
    t.integer "y_coordinate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer "hp"
    t.integer "max_hp"
    t.integer "attack_damage"
    t.integer "attack_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_monsters", force: :cascade do |t|
    t.integer "game_id"
    t.integer "monster_id"
    t.integer "x_coordinate"
    t.integer "y_coordinate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "map_id"
    t.string "description"
    t.boolean "started"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "map_tiles", force: :cascade do |t|
    t.integer "map_id"
    t.integer "tile_id"
    t.integer "x_coordinate"
    t.integer "y_coordinate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.integer "x_map_size"
    t.integer "y_map_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "max_hp"
    t.integer "attack_damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiles", force: :cascade do |t|
    t.string "name"
    t.boolean "passover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
