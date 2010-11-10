class AddContributorToAuthorships < ActiveRecord::Migration
  def self.up
    add_column :authorships, :contributor, :boolean, :default => 0
  end

  def self.down
    remove_column :authorships, :contributor
  end
end
