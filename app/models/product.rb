  # validates_uniqueness_of :sort
class Product < ActiveRecord::Base
  attr_accessible :active, :description, :sku, :price, :origprice, :sort, :title, :quantity, :url
end
