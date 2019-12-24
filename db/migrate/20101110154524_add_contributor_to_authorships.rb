# frozen_string_literal: true

class AddContributorToAuthorships < ActiveRecord::Migration[4.2]
  def self.up
    add_column :authorships, :contributor, :boolean, default: false
  end

  def self.down
    remove_column :authorships, :contributor
  end
end
