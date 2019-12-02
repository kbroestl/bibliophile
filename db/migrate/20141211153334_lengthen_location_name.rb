# frozen_string_literal: true

class LengthenLocationName < ActiveRecord::Migration
  def up
    change_column :locations, :location, :string, limit: 255
  end

  def down
    change_column :locations, :location, :string, limit: 11
  end
end
