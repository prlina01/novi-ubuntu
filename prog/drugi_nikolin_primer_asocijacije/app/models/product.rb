class Product < ApplicationRecord

  has_many :child_products, foreign_key: :parent_id, class_name: 'ProductParent'
  has_many :children_products, through: :child_products, source: :product

  has_many :product_parents, foreign_key: :product_id, class_name: 'ProductParent'
  has_many :parents, through: :product_parents, source: :parent 
end
