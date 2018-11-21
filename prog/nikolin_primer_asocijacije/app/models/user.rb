class User < ApplicationRecord
  
  has_many :korisnik_knjiga, foreign_key: :korisnik_id, class_name: 'KorisnikKnjiga'
  has_many :books, through: :korisnik_knjiga, dependent: :destroy, dependent: :destroy

end
