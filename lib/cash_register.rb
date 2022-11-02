require 'pry'

class CashRegister

    attr_reader :discount
    attr_accessor :total, :items, :last_item_price
    
    def initialize(discount=0, total=0)
        @discount=discount
        @total=total
        @items = []
    end



    def add_item(item, price, quantity=1)
        if quantity == 1
            self.total += price
            @items << item 
        elsif quantity > 1
            count_to_quanitity = 0
            while count_to_quanitity < quantity
                @items << item
                count_to_quanitity += 1
            end
            self.total += price*quantity
        end
        @last_item_price = price*quantity
    end

    def apply_discount
        if self.discount != 0
            discount_as_percent = (self.discount.to_f/100.0)
            self.total -= (discount_as_percent*self.total).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total-=@last_item_price
    end


end

cart = CashRegister.new(10, 50)
cart.apply_discount

