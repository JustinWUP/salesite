class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :price
      t.string :image
      t.boolean :active
      t.integer :sort

      t.timestamps
    end
  end
end
