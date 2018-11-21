class CreateKorisnikKnjigas < ActiveRecord::Migration[5.2]
  def change
    create_table :korisnik_knjigas do |t|

      t.timestamps
    end
  end
end
