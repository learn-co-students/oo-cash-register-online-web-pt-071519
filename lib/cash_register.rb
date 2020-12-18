require 'pry'

class CashRegister
 attr_accessor :total, :discount, :last_transaction
 
 def initialize(discount = nil)
   @discount = discount
   @total = 0
   @items = []
 end
 
 def add_item(title, price, quantity = 1)
   @total += price * quantity
   quantity.times do 
     @items << title
   end 
   @last_transaction = price *quantity
 end
 
 def apply_discount
   if discount
     @total -= (self.total.to_f * discount/ 100).to_i
     "After the discount, the total comes to $#{@total}."
   else 
     "There is no discount to apply."
   end
 end
 
 def items 
   @items 
 end
 
 def void_last_transaction
   @items.pop
   @total -= @last_transaction
 end
end