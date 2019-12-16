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

ActiveRecord::Schema.define(version: 2019_12_12_141531) do

  create_table "authors", id: :integer, limit: 2, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "author", limit: 50
    t.string "author_first", limit: 25
    t.string "author_last", limit: 25
    t.string "title", limit: 25
    t.text "other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
  end

  create_table "authorships", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "book_id", default: 0, null: false, unsigned: true
    t.integer "author_id", limit: 2, default: 0, null: false
    t.integer "translator", limit: 2, default: 0
    t.integer "editor", limit: 2, default: 0
    t.boolean "contributor", default: false
  end

  create_table "books", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.string "publisher", limit: 50
    t.integer "language_id"
    t.integer "genre_id"
    t.integer "location_id"
    t.text "notes", limit: 4294967295
    t.string "translator", limit: 50
    t.string "ISBN", limit: 14
    t.integer "pages"
    t.string "original_language", limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "excluded", default: false
    t.string "sortby_title"
  end

  create_table "child_books", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title", limit: 100
    t.string "Author", limit: 100
    t.string "language", limit: 2
    t.integer "rating", limit: 1
    t.date "date_started"
    t.date "date_finished"
    t.string "genre", limit: 5
    t.text "notes", limit: 4294967295
    t.string "translator", limit: 20
    t.string "parent_ISBN", limit: 20
    t.integer "pages"
    t.date "last_modified"
    t.string "original_language", limit: 2
  end

  create_table "genres", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "genID", limit: 5, default: "", null: false
    t.string "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "readable", default: true
  end

  create_table "languages", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "lanID", limit: 2, default: "", null: false
    t.string "Language", limit: 20
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string "name", limit: 20
  end

  create_table "locations", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "Location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "readable", default: true
  end

  create_table "old_books", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "Title", limit: 100
    t.string "Publisher", limit: 50
    t.string "Language", limit: 2
    t.string "Genre", limit: 5
    t.string "Current_Location", limit: 5
    t.text "notes", limit: 4294967295
    t.string "Translator", limit: 50
    t.string "ISBN", limit: 14
    t.integer "Pages"
    t.date "Last_Modified"
    t.string "original_language", limit: 2
    t.integer "author_id", limit: 2, null: false
    t.index ["Title", "Publisher"], name: "results_idx"
    t.index ["id"], name: "id_idx"
  end

  create_table "ratings", primary_key: "ratID", id: :integer, limit: 1, default: 0, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "rating", limit: 50
  end

  create_table "readings", id: :integer, limit: 2, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "book_id", limit: 2
    t.integer "rating", limit: 1
    t.text "comments"
    t.date "date_started"
    t.date "date_finished"
    t.datetime "updated_on"
    t.index ["id"], name: "id_idx"
  end

end
