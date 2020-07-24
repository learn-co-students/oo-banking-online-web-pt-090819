require 'pry'
class BankAccount
  attr_accessor :bank_account, :balance, :status
  attr_reader :name
def initialize (name, status = "open")
  @bank_account = bank_account
  @name = name
  @balance = 1000
  @status = status
end

def deposit (money) #My balance is set to 1000 but I want to add money
  @balance += money
end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
  @status == "open" && @balance > 0
end

def close_account
  @status = "closed"
end


end
