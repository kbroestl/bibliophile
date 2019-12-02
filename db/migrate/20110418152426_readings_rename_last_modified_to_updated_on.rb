# frozen_string_literal: true

class ReadingsRenameLastModifiedToUpdatedOn < ActiveRecord::Migration
  def self.up
    rename_column :readings, :last_modified, :updated_on
  end

  def self.down
    rename_column :readings, :updated_on, :last_modified
  end
end
