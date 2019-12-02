# frozen_string_literal: true

class AddReadableToGenres < ActiveRecord::Migration
  def self.up
    add_column :genres, :readable, :Boolean, default: true
  end

  def self.down
    remove_column :genres, :readable
  end
end
