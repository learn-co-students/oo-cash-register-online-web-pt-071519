require 'pry'

class CashRegister
    attr_accessor :total, :discount, :quantity, :title, :last_transaction, :last_item

  def initialize(discount = 0)
    @total = total
    @discount = discount
    @total = 0
    #total << @total
    @title = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    quantity == 1 ? @total += price : @total += (price.to_f * quantity)
    quantity.times do
      @title << title
    end
    self.last_transaction = price * quantity
    self.last_item = title
  end

  def apply_discount
    if
      self.discount == 0
      "There is no discount to apply."
    else
      @total -= (self.discount / '.1'.to_f)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @title
  end

#  def add_item(title, price, quantity = 0)
#    quantity == 0 ? @total += price : @total += (price.to_f * quantity.to_f)
#  end

#  def apply_discount
#    if
#      self.discount == 0
#      @total
#    else
#      @total -= (self.discount.to_f / ".1".to_f)
#    end
#  end

  def void_last_transaction
#save add item to last transaction
#take total and items list, and remove last transaction
    self.total -= self.last_transaction
    @title.pop
  end

end
