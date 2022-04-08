class Pokemon
    attr_accessor :name, :color
    def initialize
      print"enter name: "
      @name = gets.chomp
      print"enter color: "
      @color = gets.chomp
    end
  end
  
  puts "How many pokemons do you need?"
  num = gets.to_i
  array=[]
  
  def add(num,array)
    num.times do
      pokemon = Pokemon.new
      array<<{name: pokemon.name, color: pokemon.color}
    end
  end
  
  add(num,array)
  print array
  