class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
   	  t.string :publisher
      t.integer :lanugage_id
      t.integer :location_id
      t.text :notes
      t.string :ISBN
      t.integer :pages
      t.integer :original_language

    end
  end

  def self.down
    drop_table :books
  end
end
