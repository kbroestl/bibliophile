class AddGenreToBooks < ActiveRecord::Migration
  def change
    add_column :books, :genre_id, :integer
  end
end
