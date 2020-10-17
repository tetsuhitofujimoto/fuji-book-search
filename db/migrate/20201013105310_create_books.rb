class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher_name
      t.text :item_caption
      t.string :image_url
      t.string :item_url

      t.timestamps
    end
  end
end
