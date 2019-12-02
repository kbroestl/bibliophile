# frozen_string_literal: true

class AddReadableToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :readable, :Boolean, default: true
  end

  def self.down
    remove_column :locations, :readable
  end
end
