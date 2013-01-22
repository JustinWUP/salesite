class AddOrigPriceToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :origprice, :string
  end
end
