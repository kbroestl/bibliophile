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

ActiveRecord::Schema.define(version: 2023_03_09_210247) do

  create_table "authors", charset: "latin1", force: :cascade do |t|
    t.string "author"
    t.string "author_first"
    t.string "author_last"
    t.string "title"
    t.string "other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
  end

  create_table "authorships", charset: "latin1", force: :cascade do |t|
    t.integer "book_id"
    t.integer "author_id"
    t.boolean "translator", default: false
    t.boolean "editor", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "contributor", default: false
  end

  create_table "biographies", charset: "latin1", force: :cascade do |t|
    t.string "image_url"
    t.text "bio_text"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.string "publisher"
    t.integer "language_id"
    t.integer "location_id"
    t.text "notes"
    t.string "ISBN"
    t.integer "pages"
    t.integer "original_language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "excluded", default: false
    t.string "sortby_title"
    t.integer "genre_id"
  end

  create_table "genres", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "readable", default: true
  end

  create_table "languages", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "readable", default: true
  end

  create_table "readings", charset: "latin1", force: :cascade do |t|
    t.integer "book_id"
    t.integer "rating"
    t.text "comments"
    t.datetime "date_started"
    t.datetime "date_finished"
    t.datetime "updated_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
