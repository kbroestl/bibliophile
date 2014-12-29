class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :author
      t.string :author_first
      t.string :author_last
      t.string :title
      t.string :other

    end
  end

  def self.down
    drop_table :authors
  end
end
