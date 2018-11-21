class CreateWriters < ActiveRecord::Migration[5.2]
  def change
    create_table :writers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age

      t.timestamps
    end
  end
end
