BALANCE = 'balance.txt'.freeze
File.write(BALANCE, 100.00, mode: 'w') if !File.exist?(BALANCE) || File.read(BALANCE).empty?

class CashMachine
  attr_accessor :number, :holder, :balance, :status

  def initialize(number = 1, holder = 'none', balance = File.read(BALANCE).to_f, status = 200)
    @number = number
    @holder = holder
    @balance = balance
    @status = status
  end

  def balance_show
    @message = "Your balance: #{balance}$\n"
    self.status = 200
  end

  def deposit(deposit_input)
    if deposit_input > 0
      self.balance += deposit_input
      @message = "Your new balance: #{self.balance}$\n"
      self.status = 200
    else
      @message = "enter a positive number\n"
      self.status = 400
    end
    @message
  end

  def withdraw(withdraw_input)
    if withdraw_input <= self.balance && withdraw_input > 0
      self.balance -= withdraw_input
      @message = "Your new balance: #{self.balance}$\n"
      self.status = 200
    else
      @message = "enter summ smaller then your balance and bigger then null\n"
      self.status = 400
    end
    @message
  end
end
