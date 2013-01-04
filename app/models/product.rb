class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price

  validates :name, :presence => true
  validates :price, :presence => true, :numericality => true
end
