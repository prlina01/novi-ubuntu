class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :genre, foreign_key: true
      t.references :writer, foreign_key: true
      t.integer :year_published

      t.timestamps
    end
  end
end
