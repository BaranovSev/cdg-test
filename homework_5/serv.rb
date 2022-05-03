require 'socket'
require 'uri'
require 'cgi'
require_relative 'bank_class' # add bank_class

server = TCPServer.new('0.0.0.0', 3000)

cash_machine = CashMachine.new

while connection = server.accept
  request = connection.gets #
  method, path = request.split(' ')

  pp method
  pp path
  uri = URI(path)
  params = CGI::parse(uri.query || "")

  @message = 'This string we will never see'
  @status = 200

  case uri.path
  when '/balance'
    @message = cash_machine.balance
    @status = cash_machine.status
  when '/deposit'
    @message = cash_machine.deposit(params['value'].first.to_i)
    @status = cash_machine.status
  when '/withdraw'
    @message = cash_machine.withdraw(params['value'].first.to_i)
    @status = cash_machine.status
  when '/'
    @message = 'Welcome to Bank!'
    @status = cash_machine.status
  else
    @message = 'Incorrect command'
    @status = 400
  end

  connection.print "HTTP/1.1 #{@status}\r\n"
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"
  connection.print @message
  File.write(BALANCE, cash_machine.balance) # puts actual balance in balance.txt
  connection.close

end
