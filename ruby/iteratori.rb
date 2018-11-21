# class Integer
#   def my_times
#     c = 0
#     until c == self
#       yield(c)
#       c += 1
#     end
#     self
#   end
# end

# 5.my_times {|x| puts "Ja sam #{x}"}

class Array
  def my_each
    c = 0
    until c == size
      yield(self[c])
      c += 1 
    end
    self
  end
  end

#   niz = [1,2,3,4,5]

#   niz.my_each {|a| puts "#{a}!"}


class Array
  # def my_map
  #   c = 0
  #   acc = []
  #   until c == size
  #     acc << yield(self[c])
  #     c += 1
  #   end
  #   acc
  # end
  def my_map
    acc = []
    my_each { |e| acc << yield(e) }
    acc
  end
end

imena = ['Petar', 'Luka', 'Djordje']
p (imena.my_map { |i| i.upcase })