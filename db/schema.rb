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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141211153334) do

  create_table "authors", :force => true do |t|
    t.string   "author"
    t.string   "author_first"
    t.string   "author_last"
    t.string   "title"
    t.string   "other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "authorships", :force => true do |t|
    t.integer  "book_id"
    t.integer  "author_id"
    t.boolean  "translatior", :default => false
    t.boolean  "editor",      :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "contributor", :default => false
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "publisher"
    t.integer  "lanugage_id"
    t.integer  "location_id"
    t.text     "notes"
    t.string   "ISBN"
    t.integer  "pages"
    t.integer  "original_language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "excluded",          :default => false
    t.string   "sortby_title"
  end

  create_table "genres", :force => true do |t|
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "readable",   :default => true
  end

  create_table "languages", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "readable",   :default => true
  end

  create_table "readings", :force => true do |t|
    t.integer  "book_id"
    t.integer  "rating"
    t.text     "comments"
    t.datetime "date_started"
    t.datetime "date_finished"
    t.datetime "updated_on"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
