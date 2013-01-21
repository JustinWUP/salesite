class Product < ActiveRecord::Base
  attr_accessible :active, :description, :sku, :price, :sort, :title, :quantity, :url
  # validates_uniqueness_of :sort
end
