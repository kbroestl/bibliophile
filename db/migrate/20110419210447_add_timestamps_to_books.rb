# frozen_string_literal: true

class AddTimestampsToBooks < ActiveRecord::Migration[4.2]
  def self.up
    add_column :books, :created_at, :timestamp
    add_column :books, :updated_at, :timestamp
  end

  def self.down
    remove_column :books, :updated_at
    remove_column :books, :created_at
  end
end
