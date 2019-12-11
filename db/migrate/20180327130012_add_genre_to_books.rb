# frozen_string_literal: true

class AddGenreToBooks < ActiveRecord::Migration[4.2]
  def change
    add_column :books, :genre_id, :integer
  end
end
