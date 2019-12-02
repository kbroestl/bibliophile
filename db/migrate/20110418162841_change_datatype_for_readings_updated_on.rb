# frozen_string_literal: true

class ChangeDatatypeForReadingsUpdatedOn < ActiveRecord::Migration
  def self.up
    change_column :readings, :updated_on, :datetime
  end

  def self.down
    change_column :readings, :updated_on, :date
  end
end
