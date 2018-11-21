def my_iterator
  x = 0
  while x < 10
    yield
    x += 1
  end
end



my_iterator { puts 'Message printed 10 times' }


