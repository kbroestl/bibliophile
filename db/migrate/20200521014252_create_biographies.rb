class CreateBiographies < ActiveRecord::Migration[5.2]
  def change
    create_table :biographies do |t|
      t.string 'image_url'
      t.text 'bio_text'
      t.integer 'author_id'
      t.timestamps
    end
  end
end
