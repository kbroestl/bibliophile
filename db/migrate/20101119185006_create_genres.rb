# frozen_string_literal: true

class CreateGenres < ActiveRecord::Migration
  def self.up
    create_table :genres do |t|
      t.string :genre
    end
  end

  def self.down
    drop_table :genres
  end
end
