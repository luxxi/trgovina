class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :photo

  validates :name, :presence => true
  validates :price, :presence => true, :numericality => true

  has_attached_file :photo

end
