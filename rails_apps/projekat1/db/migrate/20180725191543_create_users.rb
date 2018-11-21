class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.integer :age
      t.integer :job, default: 1
      t.timestamps
    end
  end
end
