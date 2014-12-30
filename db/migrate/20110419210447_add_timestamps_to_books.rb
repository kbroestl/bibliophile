class AddTimestampsToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :created_at, :timestamp
    add_column :books, :updated_at, :timestamp
  end

  def self.down
    remove_column :books, :updated_at
    remove_column :books, :created_at
  end
end
