# frozen_string_literal: true

class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages, &:timestamps
  end

  def self.down
    drop_table :languages
  end
end
