require "pry"
class CashRegister
    attr_accessor :total, :discount, :items, :current_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        @current_item = {item => price}
        quantity.times {@items << item}
        @total += @current_item[item] * quantity

    end

    def apply_discount
        if @discount == 0 
            "There is no discount to apply."
        else
            @total -= @total.to_f * (@discount.to_f * 0.01)
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @total -= @current_item.values[0]
        @items.delete(@current_item.keys[0])

        if @items == []
            
            @total = 0.0
        end
    
    end
    
end
