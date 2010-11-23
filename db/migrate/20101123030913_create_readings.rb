class CreateReadings < ActiveRecord::Migration
  def self.up
    create_table :readings do |t|
      t.int :book_id
      t.int :rating
      t.text :comments
      t.datetime :date_started
      t.datetime :date_finished
      t.timestamp :last_modified

      t.timestamps
    end
  end

  def self.down
    drop_table :readings
  end
end
