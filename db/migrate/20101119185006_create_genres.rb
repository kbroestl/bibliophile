# frozen_string_literal: true

class CreateGenres < ActiveRecord::Migration[4.2]
  def self.up
    create_table :genres do |t|
      t.string :genre
    end
  end

  def self.down
    drop_table :genres
  end
end
