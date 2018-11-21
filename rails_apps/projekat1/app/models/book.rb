class Book < ApplicationRecord
  belongs_to :genre, required: false
  belongs_to :writer, required: false
end
