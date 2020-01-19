class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction_amount
  attr_reader :items
  
  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
    @transaction = []
  end
  
  def add_item(title, price, quantity=1)
    quantity.times do
      @items << title 
    end
    @total += price * quantity
    @transaction << {quantity: quantity, 
    amount: price * quantity}
  end
  
  def apply_discount
    if discount 
      @total = (@total - @total * @discount/100.0).to_i #applying the discount based on grand total - total mulitplied by 
     "After the discount, the total comes to $#{@total}." #give the new total after the discount 
   else
     "There is no discount to apply." # if no discount was applied give this statement
   end
  end
  
  def void_last_transaction
    #@@runninng_totals.pop
    last_transaction = @transaction.pop # go into the transaction array and delete the last transaction
    @total -= last_transaction[:amount] # go into the total and give new amount from the deleted transaction
    last_transaction[:quantity].times do # delete the quantity a set amount of times equal to the deleted items 
      @items.pop
 end
 @total # give sthe total 
end
 end





