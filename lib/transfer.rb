class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(s,r,a)
    @sender = s
    @receiver = r
    @amount = a
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    if valid? && @status == "pending" && @sender.balance > @amount
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    elsif !valid? && @status == "pending" || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.withdraw(@amount)
      @status = "reversed"
    end
  end
end
