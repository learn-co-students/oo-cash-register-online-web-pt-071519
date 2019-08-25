

class CashRegister
 attr_accessor :total, :discount, :items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @title = title
    @price = price
    @total += price*quantity
    @quantity = quantity
    count = 0
    while count < quantity
      @items << @title 
      count += 1
    end
  end
  
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      percent = @discount.to_f/100
      dis = total * percent
      @total -= dis
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  
  def void_last_transaction
    @total -= @price*@quantity
    
  end
end

