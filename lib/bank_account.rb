class BankAccount
  attr_accessor :status, :balance
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    save
  end
  
  def save
    @@all << self
  end 
  
  def deposit(deposit)
    @balance += deposit
  end 
  
  def display_balance
    "Your balance is $#{@balance}."
  end 
  
  def valid?
    status == "open" && balance > 0
  end 
  
  def close_account
    self.status = "closed"
  end 
end
