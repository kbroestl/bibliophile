# frozen_string_literal: true

class AddReadableToLocations < ActiveRecord::Migration[4.2]
  def self.up
    add_column :locations, :readable, :Boolean, default: true
  end

  def self.down
    remove_column :locations, :readable
  end
end
