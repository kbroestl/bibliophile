class RenameGenreToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :genre, :name
  end
end
