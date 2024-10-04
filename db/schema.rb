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

ActiveRecord::Schema[7.1].define(version: 2024_10_04_110547) do
  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rating_categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "weight", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_rating_categories_on_name", unique: true
  end

  create_table "rating_scores", force: :cascade do |t|
    t.integer "rating_category_id", null: false
    t.integer "rating_id", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating_category_id"], name: "index_rating_scores_on_rating_category_id"
    t.index ["rating_id"], name: "index_rating_scores_on_rating_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
  end

  add_foreign_key "rating_scores", "rating_categories"
  add_foreign_key "rating_scores", "ratings"
  add_foreign_key "ratings", "movies"
end
