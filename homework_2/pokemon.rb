puts "How many pokemons do you need?"
num = gets.to_i

def add(num)
  array=[]

  num.times do
    name = gets.chomp
    color = gets.chomp
    array << {name: name, color: color}
  end

  array
end

print add(num)

