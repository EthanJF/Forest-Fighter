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

ActiveRecord::Schema.define(version: 2019_10_01_004623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "max_health"
    t.string "class_type"
    t.integer "strength"
    t.integer "current_health"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "character_id"
    t.integer "result_id"
    t.string "option"
    t.string "choice_made"
  end

  create_table "fights", force: :cascade do |t|
    t.string "location"
    t.integer "monster_id"
    t.integer "choice_id"
    t.boolean "fight"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "fight_damage"
    t.integer "run_damage"
    t.string "art"
  end

  create_table "results", force: :cascade do |t|
    t.boolean "did_win?"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "wins"
    t.integer "losses"
  end

end
