# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_12_115148) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_name"
  end

  create_table "content_actors", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "content_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_content_actors_on_actor_id"
    t.index ["content_id"], name: "index_content_actors_on_content_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "name"
    t.date "watchedday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "cast_id"
    t.integer "appear_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appear_id"], name: "index_relationships_on_appear_id"
    t.index ["cast_id", "appear_id"], name: "index_relationships_on_cast_id_and_appear_id", unique: true
    t.index ["cast_id"], name: "index_relationships_on_cast_id"
  end

  add_foreign_key "content_actors", "actors"
  add_foreign_key "content_actors", "contents"
end
