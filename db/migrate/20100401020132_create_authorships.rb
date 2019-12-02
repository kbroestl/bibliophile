# frozen_string_literal: true

class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.integer :book_id
      t.integer :author_id
      t.boolean :translatior, default: false
      t.boolean :editor, default: false
      t.timestamps
    end
  end

  def self.down
    drop_table :authorships
  end
end
