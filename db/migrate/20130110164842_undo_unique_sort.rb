class UndoUniqueSort < ActiveRecord::Migration
  def change
  	remove_index :products, :sort
  end
end
