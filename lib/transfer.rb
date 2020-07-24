require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :transfer, :status, :amount
  
  def initialize( sender, receiver, transfer)
    @transfer = transfer
    @receiver = receiver
    #@balance = balance
    @sender = sender
    @status = "pending"
    @amount = 50
  end
  
  def valid?
    sender.status == "open" && receiver.status == "open"
    sender.valid?
    receiver.valid?
  end
  
  def execute_transaction
    #binding.pry
    #if transfer is valid...etc
       #add amount to reciver 
       #sub amount from sender
       #change the status to complete
       
    if valid? && sender.balance > @transfer && @status == "pending"
      sender.balance -= @transfer
       receiver.balance += @transfer
    @status = "complete"
  else
    @status = "rejected"
    
    "Transaction rejected. Please check your account balance."
      #binding.pry
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  
  end
  
  
end
