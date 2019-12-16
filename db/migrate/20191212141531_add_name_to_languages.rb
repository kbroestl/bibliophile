class AddNameToLanguages < ActiveRecord::Migration[5.2]
  def change
  	add_column :languages, :name, :string, limit: 20
  end
end
