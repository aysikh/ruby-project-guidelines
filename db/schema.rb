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

ActiveRecord::Schema.define(version: 4) do

  create_table "bar", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "drink_id"
  end

  create_table "bartenders", force: :cascade do |t|
    t.string "name"
    t.float "years_of_experience"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "favorite_drink_id"
    t.integer "favorite_bartender_id"
    t.boolean "is_over_21"
    t.boolean "is_a_regular"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "liquor"
    t.string "ingredients"
    t.float "fluid_ounce"
  end

end
