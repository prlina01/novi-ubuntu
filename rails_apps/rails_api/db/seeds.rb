20.times do |n|
  Book.create! title: Faker::Book.title,
               author: Faker::Book.author,
               image: Faker::Avatar.image
end