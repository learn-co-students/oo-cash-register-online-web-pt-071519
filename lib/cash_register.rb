require 'pry'

class CashRegister
    attr_accessor :total, :discount, :quantity, :title

  def initialize(discount = 0)
    @total = total
    @discount = discount
    @total = 0
    #total << @total
    @@title = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 0)
    quantity == 0 ? @total += price : @total += (price.to_f * quantity.to_f)
    @@title << (title * quantity).split(" ")
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
    @@title
    binding.pry
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

  end

end
