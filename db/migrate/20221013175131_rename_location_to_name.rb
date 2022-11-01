class RenameLocationToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :locations, :location, :name
  end
end
