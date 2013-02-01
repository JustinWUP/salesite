class AddStoreSettingsTable < ActiveRecord::Migration
  def change
  	create_table :settings do |t|
  		 t.string :title
  		 t.boolean :onstate
  	end

  end
end
