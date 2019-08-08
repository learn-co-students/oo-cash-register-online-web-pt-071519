require 'pry'

class CashRegister
    attr_accessor :total, :last_transaction, :discount, :items

    def initialize(employee_discount = nil)
        self.total = 0
        self.discount = employee_discount
        self.items = []
    end

    def add_item(title, price, quantity = 1) 
        self.total += price * quantity
        @last_transaction = price * quantity
        if quantity == 1
            self.items << title
        else
            quantity.times do
                self.items << title
            end
        end
    end

    def apply_discount
        if !self.discount
            "There is no discount to apply."
        else
            multiplier = (1.0 - (self.discount.to_f / 100.0))
            self.total = (self.total.to_f * multiplier).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end