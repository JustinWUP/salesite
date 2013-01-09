class AddUrlQuantityToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :url, :string
  	add_column :products, :quantity, :integer
  end
end
