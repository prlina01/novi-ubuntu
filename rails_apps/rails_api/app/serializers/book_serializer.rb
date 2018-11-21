class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :image, :average_rating_of_book 

  has_many :reviews
end
