class BankAccount
  attr_reader :name 
  attr_accessor :status, :balance
  
  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end
  
  def deposit(amount)
    @balance += amount
    @balance
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    self.status == "open" && @balance > 0
  end
  
  def close_account
    self.balance = 0 
    self.status = "closed"
  end
end

