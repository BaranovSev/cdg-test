LIST = "router_task.txt"
BUFFER = "buffer.txt"

    
def id_user_input
  user_input = nil
  loop do
    user_input = gets.to_i
    if user_input < 0 
      puts "id must be in the range from zero and above\nrepeat enter id: " 
    end
    break if user_input >= 0
    end
    user_input
end

module Resource
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        verb = nil
        commands_1 = ["GET","POST","PUT","DELETE","Q"]
        
        loop do
          print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
          verb = gets.chomp.upcase
          if !commands_1.include? verb
            print"Only GET/POST/PUT/DELETE comands available\n"
          end
            break if commands_1.include? verb
        end
        
        break if verb == 'Q'
  
        action = nil
  
        if verb == 'GET'
          commands_2 = ["index", "show", "q"]
          
          loop do
            print 'Choose action (index/show) / q to exit: '
            action = gets.chomp.downcase
            if !commands_2.include? action
              print"Only index/show comands available\n"
            end
            break if commands_2.include? action
          end

          break if action == 'q'
        end
  
  
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
  
  class PostsController
    extend Resource 
  
    def initialize
      @posts = []
    end
  
    def index
      File.foreach(LIST).with_index { |line, index| puts "#{index}. #{line}" }
    end
  
    def show
      print "Enter id of post that you need to find: "
      id = id_user_input
      File.foreach(LIST).with_index do |line, index| 
        print line if id == index
      end
    end
  
    def create
      print "Enter the text of post that you wish to add: "
      text_user_input = gets
      File.write(LIST,text_user_input, mode: "a")
      File.foreach(LIST).with_index do |line, index| 
        print "#{index}. #{line}" if text_user_input == line
      end
    end
  
    def update
      print "Enter the text of post that you wish to update: "
      id = id_user_input
      print "Enter new text: "
      string = gets
      file = File.open(BUFFER, 'w')
      File.foreach(LIST).with_index do |line, index|
        file.puts(id == index ? string : line)
      end

      file.close
      File.write(LIST, File.read(BUFFER))
      File.delete(BUFFER) if File.exist?(BUFFER)
      index
    end
  
    def destroy
      print "Enter id of post that you need to delete: "
      id = id_user_input
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
  end
  
  class Router
    def initialize
      @routes = {}
    end
  
    def init
      resources(PostsController, 'posts')
  
      loop do
        print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
        choise = gets.chomp.upcase
  
        PostsController.connection(@routes['posts']) if choise == '1'
        #extend Resource потому что мы не создаем экземпляр класса, но вызываем функцию модуля на класс 
        break if choise == 'Q'
      end
  
      puts 'Good bye!'
    end
  
    def resources(klass, keyword)
      controller = klass.new
      @routes[keyword] = {
        'GET' => {
          'index' => controller.method(:index),
          'show' => controller.method(:show)
        },
        'POST' => controller.method(:create),
        'PUT' => controller.method(:update),
        'DELETE' => controller.method(:destroy)
      }
    end
  end
  
  router = Router.new
  
  router.init