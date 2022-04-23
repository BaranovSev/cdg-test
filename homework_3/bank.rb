NAVIGATION = "\nPress 'B' to show balance\nPress 'D' to deposite\nPress 'W' to widraw\nPress 'Q' to quit\n\nYour command>> "
BUFFER = "buffer.txt"
BALANCE = "balance.txt"   
File.write(BALANCE, 100.00, mode: "w") if !File.exist?(BALANCE) || File.read(BALANCE).empty?
# create balance.txt if it's empty or didn't exist

def balance
    File.read(BALANCE).to_f
end

def deposit
    print"Enter a sum of deposit: "
    deposit_input = gets.to_f.round(2) # округление до 2х знаков после точки
    if deposit_input > 0 
        file = File.open(BUFFER, 'w')
        file.puts("#{deposit_input+ balance}")
        file.close
  
        File.write(BALANCE, File.read(BUFFER))
        File.delete(BUFFER) if File.exist?(BUFFER)
        print "Your new balance: #{balance}$\n"
    else
        print "enter a positive number\n"
    end
end

def withdraw
    print"Maximum sum of withdraw:#{balance}$\nEnter a sum of withdraw: "
    withdraw_input = gets.to_f.round(2)
    if withdraw_input <= balance && withdraw_input > 0
        file = File.open(BUFFER, 'w')
        file.puts("#{balance - withdraw_input}")
        file.close
        
        File.write(BALANCE, File.read(BUFFER))
        File.delete(BUFFER) if File.exist?(BUFFER)
        print "Your new balance: #{balance}$\n"
    else
        print "enter summ smaller then your balance and bigger then null\n"
    end
end


def user_nav 

loop do
    print NAVIGATION
    user_command = gets.chomp.upcase

    case user_command
when "B"
    print "Your balance: #{balance}$\n"
    
when "D"
    deposit

when "W"
    withdraw

when "Q"
    break

else print "incorrect command:\n\n" 
    
end
break if user_command == "Q"
end
print "You left the bank\n"
end

user_nav #start programm

