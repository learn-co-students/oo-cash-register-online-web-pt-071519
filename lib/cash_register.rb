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
    #@runninng_totals << @total
    @transaction << {quantity: quantity, 
    amount: price * quantity}
  end
  
  def apply_discount
    if discount 
      @total = (@total - @total * @discount/100.0).to_i
     "After the discount, the total comes to $#{@total}."
   else
     "There is no discount to apply."
   end
  end
  
  def void_last_transaction
    #@@runninng_totals.pop
    last_transaction = @transaction.pop
    @total -= last_transaction[:amount]
    last_transaction[:quantity].times do
      @items.pop
 end
 @total
end
 end





