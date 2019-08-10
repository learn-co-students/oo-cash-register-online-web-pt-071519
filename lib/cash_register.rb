class CashRegister
  
  attr_accessor :total, :discount, :last_transaction
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @last_transaction = last_transaction
    @items = []
  end
  
  def add_item(title, price, quantity = 0)
    if quantity >= 1
    quantity.times do
      @items << title
      @last_transaction = price*quantity
    end
    amount = price*quantity
    @total += amount
    else
      @items << title
      @total +=price
      @last_transaction = price
    end
  end
  
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
    @total -= @total * @discount/100
    return "After the discount, the total comes to $#{@total}."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total -= @last_transaction
  end
  
end