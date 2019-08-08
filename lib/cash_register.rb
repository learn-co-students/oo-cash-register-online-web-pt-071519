require 'pry'

class CashRegister
    attr_accessor :total, :last_transaction, :discount, :items

    def initialize(employee_discount = nil)
        @total = 0
        @discount = employee_discount
        @items = []
    end

    def add_item(title, price, quantity = 1) 
        self.total += price * quantity
        @last_transaction = price * quantity
        if quantity == 1
            @items << title
        else
            quantity.times do
                @items << title
            end
        end
    end

    def apply_discount
        if !self.discount
            "There is no discount to apply."
        else
            multiplier = (1.0 - (self.discount.to_f / 100.0))
            @total = (self.total.to_f * multiplier).to_i
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= last_transaction
    end
end