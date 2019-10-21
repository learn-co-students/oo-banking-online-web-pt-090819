require 'pry'
class Transfer
  
  attr_reader :status
  attr_accessor :sender, :receiver, :amount, :bank_account
  
  @@all = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def self.all
    @@all
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
#    binding.pry
    if @sender.balance > @amount && @status == "pending" && valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
#      @sender.valid?
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
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



