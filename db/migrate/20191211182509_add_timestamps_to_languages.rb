class AddTimestampsToLanguages < ActiveRecord::Migration[5.2]
  def change
  	add_column :languages, :created_at, :timestamp
  	add_column :languages, :updated_at, :timestamp
  end
end
