puts "Enter some word: "
word =gets.chomp

def cs_fun(word)
  if word.end_with? "CS"
    2**word.length
  else
    word.reverse
  end
end

puts cs_fun(word)

