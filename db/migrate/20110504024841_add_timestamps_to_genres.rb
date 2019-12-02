# frozen_string_literal: true

class AddTimestampsToGenres < ActiveRecord::Migration
  def self.up
    add_column :genres, :created_at, :timestamp
    add_column :genres, :updated_at, :timestamp
  end

  def self.down
    remove_column :genres, :updated_at
    remove_column :genres, :created_at
  end
end
