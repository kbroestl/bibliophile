# frozen_string_literal: true

class ElongateGenreNames < ActiveRecord::Migration[4.2]
  def self.up
    change_column :genres, :genre, :string
  end

  def self.down
    # :string is the default without length is kind of
    # the default for text without going for a whole text field
    raise ActiveRecord::IrreversibleMigration, ':string is already default'
  end
end
