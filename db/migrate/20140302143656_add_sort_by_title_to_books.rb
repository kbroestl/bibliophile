# frozen_string_literal: true

class AddSortByTitleToBooks < ActiveRecord::Migration[4.2]
  def change
    add_column :books, :sortby_title, :string
  end
end
