class AddSortByTitleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :sortby_title, :string
  end
end
