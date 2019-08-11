require 'pry'
class CashRegister
    attr_accessor :discount, :total, :price, :items, :last_transaction
    
def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
end

def add_item(title, price, quantity = 1)
    @price = price
    @total += price * quantity
    if quantity > 1
    counter = 0
    while counter < quantity
      @items << title
      counter += 1
    end
  else
    @items << title
  end
    @last_transaction = price * quantity
end



def apply_discount
    if discount > 0
     @to_take_off = (price * discount)/100
     @total -= @to_take_off
     #@total = (@total - @total * @discount/100.0).to_i
     return "After the discount, the total comes to $#{@total}."
    else
     return "There is no discount to apply."
    end
  end


    def void_last_transaction
    @total -= @last_transaction
    
    end   
end        
