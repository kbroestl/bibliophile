# frozen_string_literal: true

class AddExcludedToBooks < ActiveRecord::Migration[4.2]
  def self.up
    add_column :books, :excluded, :boolean, default: 0
  end

  def self.down
    remove_column :books, :excluded
  end
end
