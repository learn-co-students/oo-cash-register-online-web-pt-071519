class CashRegister
  
  attr_accessor :discount, :total, :items
  
  def initialize(discount=nil) 
    @total = 0 
    @discount = discount
    @items = [] #when we make a new CashRegister, we initialize it with a new empty items array
    @running_totals = [0]
  end
  
  def add_item(title, price, quantity=1)
    quantity.times do 
      @items << title
    end
    @total += price * quantity  #@total += price is the same as saying @total = total + price
    @running_totals << @total
   end

  def apply_discount
    if discount 
      @total = (@total - @total * @discount/100.0).to_i  #we need to convert this number to an integer otherwise we get an error message, "nil can't be coerced into Integer"
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end
  
  def void_last_transaction
    @running_totals.pop #removes the last transaction
    @total = @running_totals.last #this gives us .99
  end
  
end

