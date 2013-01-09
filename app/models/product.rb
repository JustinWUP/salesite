class Product < ActiveRecord::Base
  attr_accessible :active, :description, :image, :price, :sort, :title, :quantity, :url
end
