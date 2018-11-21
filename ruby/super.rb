class Glavna
  
  def prikazi
    puts 'Glavna'
  end
end

class Sporedna < Glavna
  
  def prikazi
    if super
      puts 'Sporedna'
    end
  end
end

x = Sporedna.new

x.prikazi