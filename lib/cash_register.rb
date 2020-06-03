require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :prices

    def initialize(discount = 0.0)
        @total = 0.0
        @discount = discount
        @items = []
        @prices = []
    end 

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times {@items << title}
        quantity.times {@prices<<price * quantity}
    end

    def apply_discount
        (@total -= (@total * @discount * 0.01).to_i)
        return "After the discount, the total comes to $#{@total.to_i}." if @discount != 0
        return "There is no discount to apply." if @discount == 0
    end 

    def void_last_transaction
       @total -= @prices.last
    end 

end 