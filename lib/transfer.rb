require 'pry'

class Transfer
  
  attr_accessor :status, :sender, :receiver, :amount
  #attr_reader 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid? 
   sender.valid? && receiver.valid?
  end

  def reject 
    self.status = "rejected"
    p "Transaction rejected. Please check your account balance."
  end 
  

  def execute_transaction
    if !sender.valid? || self.status == "complete"
      reject
    elsif !receiver.valid? || sender.balance < amount
      reject 
        else 
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      new_sender = receiver 
      new_receiver = sender
      new_transfer = Transfer.new(new_sender, new_receiver, amount)
      new_transfer.execute_transaction
      self.status = "reversed"
    end
  end 

end
