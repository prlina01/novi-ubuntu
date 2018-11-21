class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :goals
      t.integer :score
      t.integer :assists

      t.timestamps
    end
  end
end
