class Book < ApplicationRecord
  
  has_many :korisnik_knjiga, class_name: 'KorisnikKnjiga', foreign_key: :knjiga_id
  has_many :users, through: :korisnik_knjiga, dependent: :destroy
end
