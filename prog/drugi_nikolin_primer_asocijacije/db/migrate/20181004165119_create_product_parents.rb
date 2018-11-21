class CreateProductParents < ActiveRecord::Migration[5.2]
  def change
    create_table :product_parents do |t|
      t.references :product, foreign_key: { to_table: :products }, index: true
      t.references :parent, foreign_key: { to_table: :products }, index: true 

      t.timestamps
    end
  end
end
