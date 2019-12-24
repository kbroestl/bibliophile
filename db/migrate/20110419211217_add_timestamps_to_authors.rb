# frozen_string_literal: true

class AddTimestampsToAuthors < ActiveRecord::Migration[4.2]
  def self.up
    add_column :authors, :created_at, :timestamp
    add_column :authors, :updated_at, :timestamp
  end

  def self.down
    remove_column :authors, :updated_at
    remove_column :authors, :created_at
  end
end
