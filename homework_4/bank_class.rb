NAVIGATION = "\nPress 'B' to show balance\nPress 'D' to deposite\nPress 'W' to widraw\nPress 'Q' to quit\n\nYour command>> "
BUFFER = "buffer.txt"
BALANCE = "balance.txt"   
File.write(BALANCE, 100.00, mode: "w") if !File.exist?(BALANCE) || File.read(BALANCE).empty?

class CashMachine
    
    attr_accessor :number, :holder, :balance
    
    def initialize (number = 12345, holder = "none", balance = File.read(BALANCE).to_f)
        @number = number
        @holder = holder
        @balance = balance
    end
    #Программа должна запускаться с помощью метода класса init, 
    #создавать экземпляр класса и взаимодействовать с пользователем согласно условиям задачи
    def balance_show
        print "Your balance: #{self.balance}$\n"
    end

    def deposit
        print"Enter a sum of deposit: "
        deposit_input = gets.to_f.round(2) # округление до 2х знаков после точки
        if deposit_input > 0 
            self.balance += deposit_input
            print "Your new balance: #{self.balance}$\n"
        else
            print "enter a positive number\n"
        end
    end

    def withdraw
        print"Maximum sum of withdraw:#{self.balance}$\nEnter a sum of withdraw: "
        withdraw_input = gets.to_f.round(2)
        if withdraw_input <= self.balance && withdraw_input > 0
            self.balance -= withdraw_input
            print "Your new balance: #{self.balance}$\n"
        else
            print "enter summ smaller then your balance and bigger then null\n"
        end
    end

    def self.init
        cashMachine = CashMachine.new
        loop do
            print NAVIGATION
            user_command = gets.chomp.upcase
        
            case user_command
        when "B"
            cashMachine.balance_show
            
        when "D"
            cashMachine.deposit
        
        when "W"
            cashMachine.withdraw
        
        when "Q"
            break
        
        else print "incorrect command:\n\n" 
            
        end
        break if user_command == "Q"
        end
        
        file = File.open(BUFFER, 'w')
        file.puts("#{cashMachine.balance}")  # push balance to file
        file.close
        
        File.write(BALANCE, File.read(BUFFER))
        File.delete(BUFFER) if File.exist?(BUFFER)
        print "You left the bank\n"
    end

end

CashMachine.init
