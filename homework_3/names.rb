NAMES = 'names.txt'
RESULTS = 'results.txt'
#BUFFER = 'buffer.txt'


# def magic(pattern) #find string by pattern and add them to RESULT
#   string = File.open(NAMES).readlines.find_all {|line| line.scan(/\d+/).join.to_i == pattern}.join  #return all strings with pattern
#   File.write(BUFFER, string)
#   File.write(RESULTS,File.read(BUFFER), mode: "a")
#   File.delete(BUFFER) if File.exist?(BUFFER)
# end

# #here is the start

# loop do
#   puts "enter age: "
#   age = gets.to_i
#   magic(age)
#   break if age == -1 || comparison
# end    

# File.foreach(RESULTS) { |line| puts line }
 
#=======================================================================
# def search_id(age)       #find id by pattern
#   array = []
#   file = File.open(NAMES, "r")
#   file.readlines.each.with_index do |line, index|  
#       if line.scan(/\d+/).join.to_i == age # scan returns array of all numbers in line 
#     #then use join to converting each element of the array to a string, then converting all to numbers
#     array << index
#     end
#   end
#   array
# end

# def find(id)       #find string by id
#   string = []
#   id.each do |id_item|
#     File.foreach(NAMES).with_index do |line, index|
#       string << line if index == id_item
#     end
#   end
#   string
# end

#===================================================================

def search(pattern) #find all strings with pattern
  array = ""
  file = File.open(NAMES, "r")
  file.readlines.each do |line|  
      if line.scan(/\d+/).join.to_i == pattern # scan returns array of all numbers in line 
    #then use join to converting each element of the array to a string, then converting all to numbers
    array << line
    end
  end
  array
end

def append(string)
  File.write(RESULTS,string, mode: "a") 
  # .join returns the string which is created 
  # by converting each element of the array to a string
end

def comparison
  file = File.readlines(NAMES).sort.uniq # .sort.uniq sort all strings in file adn check them uniq
  file_result = File.readlines(RESULTS).sort.uniq
  if file == file_result
    true
  else
    false
  end  
end

loop do
  puts "enter age: "
  pattern = gets.to_i  #pattern (means age)
  string = search(pattern)
  append(string)
    break if pattern == -1 || comparison
  end
  
  File.foreach(RESULTS) { |line| puts line }