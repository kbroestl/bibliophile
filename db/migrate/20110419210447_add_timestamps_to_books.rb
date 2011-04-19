class AddTimestampsToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :created_at, :timestamp
    add_column :books, :updated_at, :timestamp
    remove_column :books, :last_modified
  end

  def self.down
    add_column :books, :last_modified, :timestamp
    remove_column :books, :updated_at
    remove_column :books, :created_at
  end
end
