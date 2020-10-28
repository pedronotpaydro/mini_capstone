class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :abv
      t.string :brewery
      t.string :description
      t.string :size
      t.string :image_url

      t.timestamps
    end
  end
end
