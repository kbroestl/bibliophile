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

ActiveRecord::Schema.define(:version => 20110504024841) do

  create_table "authors", :force => true do |t|
    t.string   "author",       :limit => 50
    t.string   "author_first", :limit => 25
    t.string   "author_last",  :limit => 25
    t.string   "title",        :limit => 25
    t.text     "other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "authorships", :force => true do |t|
    t.integer "book_id",                  :default => 0,     :null => false
    t.integer "author_id",   :limit => 2, :default => 0,     :null => false
    t.integer "translator",  :limit => 2, :default => 0
    t.integer "editor",      :limit => 2, :default => 0
    t.boolean "contributor",              :default => false
  end

  create_table "books", :force => true do |t|
    t.string   "title",             :limit => 100
    t.string   "publisher",         :limit => 50
    t.integer  "language_id"
    t.integer  "genre_id"
    t.integer  "location_id"
    t.text     "notes",             :limit => 2147483647
    t.string   "translator",        :limit => 50
    t.string   "ISBN",              :limit => 14
    t.integer  "pages"
    t.string   "original_language", :limit => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_books", :force => true do |t|
    t.string  "title",             :limit => 100
    t.string  "Author",            :limit => 100
    t.string  "language",          :limit => 2
    t.integer "rating",            :limit => 1
    t.date    "date_started"
    t.date    "date_finished"
    t.string  "genre",             :limit => 5
    t.text    "notes",             :limit => 2147483647
    t.string  "translator",        :limit => 20
    t.string  "parent_ISBN",       :limit => 20
    t.integer "pages"
    t.date    "last_modified"
    t.string  "original_language", :limit => 2
  end

  create_table "genres", :force => true do |t|
    t.string   "genID",      :limit => 5,  :default => "", :null => false
    t.string   "genre",      :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string "lanID",    :limit => 2,  :default => "", :null => false
    t.string "Language", :limit => 20
  end

  create_table "locations", :force => true do |t|
    t.string   "Location",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_books", :force => true do |t|
    t.string  "Title",             :limit => 100
    t.string  "Publisher",         :limit => 50
    t.string  "Language",          :limit => 2
    t.string  "Genre",             :limit => 5
    t.string  "Current_Location",  :limit => 5
    t.text    "notes",             :limit => 2147483647
    t.string  "Translator",        :limit => 50
    t.string  "ISBN",              :limit => 14
    t.integer "Pages"
    t.date    "Last_Modified"
    t.string  "original_language", :limit => 2
    t.integer "author_id",         :limit => 2,          :null => false
  end

  add_index "old_books", ["Title", "Publisher"], :name => "results_idx"
  add_index "old_books", ["id"], :name => "id_idx"

  create_table "ratings", :primary_key => "ratID", :force => true do |t|
    t.string "rating", :limit => 50
  end

  create_table "readings", :force => true do |t|
    t.integer  "book_id",       :limit => 2
    t.integer  "rating",        :limit => 1
    t.text     "comments"
    t.date     "date_started"
    t.date     "date_finished"
    t.datetime "updated_on"
  end

  add_index "readings", ["id"], :name => "id_idx"

  create_table "users", :force => true do |t|
    t.string "username",  :limit => 20
    t.string "role",      :limit => 10
    t.string "real_name", :limit => 150
    t.string "password",  :limit => 32
  end

end
