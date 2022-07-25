def greeting(age,name,last_name)
  if age >= 18
    "Привет, #{name} #{last_name}. Самое время заняться делом!"
  else 
    "Привет, #{name} #{last_name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано."
  end
end

puts "Enter your name: "
name = gets.chomp
puts "enter your last name: "
last_name = gets.chomp
puts "enter your age: "
age = gets.to_i
puts greeting(age,name,last_name)

def foobar(array)
  if array.include?(20) 
    array[1]
  else
    array.sum
  end
end

puts "Enter two numbers:"
array = [gets.to_i,gets.to_i] 
puts foobar(array)
