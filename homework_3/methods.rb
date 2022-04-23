LIST = 'file.txt'
BUFFER = 'buffer.txt'

def index
  File.foreach(LIST) { |line| puts line }
end

def find(id)
  File.foreach(LIST).with_index do |line, index|
    @string = line if index == id
  end
  @string
end

def where(pattern) #returns array of id
  #puts File.open("file.txt").readlines.find_all {|line| line.include?(pattern)}  return all strings with pattern
  array = []
  File.foreach(LIST).with_index do |line, index|
    if line.include?(pattern) 
      array<<index + 1
    end
  end
  puts array
end

def update(id, string)
  file = File.open(BUFFER, 'w')
  File.foreach(LIST).with_index do |line, index|
    file.puts(id == index ? string : line)
  end

  file.close
  File.write(LIST, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, 'w')
  File.foreach(LIST).with_index do |line, index|
    if id != index
      file.puts (line)
    end
  end

  file.close
  File.write(LIST, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end




index
find(1)
where("B")
update(0, "555 line")
delete(0)

