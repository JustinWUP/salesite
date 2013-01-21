class RenameImageToSku < ActiveRecord::Migration
  def change
  	rename_column :products, :image, :sku
  end
end
