require 'pry'

class CashRegister
  attr_accessor :total, :discount
  
  def initialize(discount = nil)
    @total = 0 
    @discount = discount 
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    self.total += price * quantity 
    quantity.times do 
      @items << title
    end
    @last_item = price * quantity
  end
  
  def apply_discount 
    if discount 
      self.total -= (self.total.to_f * discount/ 100).to_i
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
    self.total -= @last_item
  end
  
end