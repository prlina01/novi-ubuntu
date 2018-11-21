class KorisnikKnjiga < ApplicationRecord
  self.table_name = 'korisnik_knjiga'

  belongs_to :book, foreign_key: :knjiga_id
  belongs_to :user, foreign_key: :korisnik_id
end
