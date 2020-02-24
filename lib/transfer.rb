class Transfer
  attr_accessor :sender, :receiver, :status, :amount

    def initialize(sender, receiver, status = "pending", amount)
      @sender = sender
      @receiver = receiver
      @status = status
      @amount = amount
      end
      
    def valid?
      #if @sender or @receiver < 0
       # @status == "not valid"
      #elsif
       # @sender or @receiver > 0
        #@status == "valid"
      #end
      @sender.valid? && @receiver.valid? ? true : false
    end
    
    
    def execute_transaction
      if @sender.balance > @amount && @status == "pending" && valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
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