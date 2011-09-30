class AddExcludedToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :excluded, :boolean, :default => 0
  end

  def self.down
    remove_column :books, :excluded
  end
end
