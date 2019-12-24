# frozen_string_literal: true

class AddNameToAuthors < ActiveRecord::Migration[4.2]
  def self.up
    add_column :authors, :name, :string
  end

  def self.down
    remove_column :authors, :name
  end
end
