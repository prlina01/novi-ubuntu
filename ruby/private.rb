class Resturant
end

class Kitchen < Resturant
  
  def menu
    puts 'Izaberite'
  end

  private def internals
    puts 'Radimo vrmmm!'
  end
end

kuhinja = Kitchen.new

kuhinja.internals