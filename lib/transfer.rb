class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender,receiver,amount)
      @sender = sender
      @receiver = receiver 
      @amount = 50
      @status = "pending"
  end 
  
  def amount
      @amount
  end
  
  def valid?
     @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
        if self.valid? && sender.balance >= amount && @status == "pending"
        sender.balance -= amount
        receiver.balance += amount 
        @status ="complete"
      else
         
        sender.balance < amount 
        @status ="rejected"
        "Transaction rejected. Please check your account balance."
      
      end
  end  
  
  def reverse_transfer
    
  end 
   
end
