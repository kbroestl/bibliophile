# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[4.2]
  def self.up
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.integer :language_id
      t.integer :location_id
      t.text :notes
      t.string :ISBN
      t.integer :pages
      t.integer :original_language
    end
  end

  def self.down
    drop_table :books
  end
end
