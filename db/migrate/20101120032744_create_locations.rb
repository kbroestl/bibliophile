# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[4.2]
  def self.up
    create_table :locations do |t|
      t.string :location
    end
  end

  def self.down
    drop_table :locations
  end
end
