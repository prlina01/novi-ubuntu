class ProductParent < ApplicationRecord
  belongs_to :product
  belongs_to :parent, class_name: 'Product', optional: true
end
