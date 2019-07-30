require 'pry'
class CashRegister
  attr_accessor :total, :discount, :price, :items, :title, :transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @price = price
    self.total += price * quantity
    if quantity > 1
      counter = 0
      while counter < quantity
        self.items << title
        counter += 1
      end
    else
      self.items << title
    end
    self.transaction = price * quantity
  end


  def apply_discount
    if self.discount > 0
      amount_to_discount = (price * discount)/100
      # binding.pry
      self.total -= amount_to_discount
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

def void_last_transaction
  self.total = self.total - self.transaction
end

end
