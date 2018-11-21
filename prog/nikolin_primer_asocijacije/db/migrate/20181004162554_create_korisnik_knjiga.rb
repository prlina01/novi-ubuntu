class CreateKorisnikKnjiga < ActiveRecord::Migration[5.2]
  def change
    create_table :korisnik_knjiga do |t|
      t.references :korisnik, foreign_key: { to_table: :users }, index: true
      t.references :knjiga, foreign_key: { to_table: :books }, index: true
    end
  end
end
