# frozen_string_literal: true

class AddTimestampsToLocations < ActiveRecord::Migration[4.2]
  def self.up
    add_column :locations, :created_at, :timestamp
    add_column :locations, :updated_at, :timestamp
  end

  def self.down
    remove_column :locations, :updated_at
    remove_column :locations, :created_at
  end
end
