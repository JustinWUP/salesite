class AddIndexToProducts < ActiveRecord::Migration
  def change
  	add_index :products, :sort, :unique => true
  end
end
