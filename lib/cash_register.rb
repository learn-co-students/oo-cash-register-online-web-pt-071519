class CashRegister
attr_accessor :discount, :total, :items

def initialize(discount=0)
  @total = 0
  @discount = discount
  @items = [ ]
  @running_totals = [0]
end

def add_item(title, price, quantity=1)
  quantity.times do
    @items << title
  end
  @total += price * quantity
  @running_totals << @total
end 

def apply_discount
  if discount > 0
    @total = (@total - @total * @discount/100.0).to_i
    "After the discount, the total comes to $#{@total}."
  else
    "There is no discount to apply."
    end  
  end
  
  def void_last_transaction
    @running_totals.pop
    @total = @running_totals.last
  end
end