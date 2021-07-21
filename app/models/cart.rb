class Cart
    def initialize(cart_items={})
        @cart_items = cart_items || {}
    end

    #Get cart items
    def get_items
        return @cart_items
    end

    #Add item in cart
    def add_item(item)
        @cart_items[item] = @cart_items[item].to_i + 1
    end

    #Remove item from cart
    def remove_item(item)
        if @cart_items.keys.include?(item) && @cart_items[item].to_i > 0
            @cart_items[item] = (@cart_items[item].to_i - 1) 
            return true
        else
            return false
        end
    end

    #Get the total number of items
    def total_items
        @cart_items.sum{|k,v| v}
    end

    def total_price
        price = 0
        @cart_items.map do |k,v|
            product = Product.where(code: k.to_s).first
            price += calculate_price(product, v)
        end
        price
    end

    private def calculate_price product, amount
        return 0 if amount == 0
        price = 0
        case product.code.to_s
            when "GR1"
                price = product.price * amount
                discount = amount > 1 ? ((amount / 2).to_i * product.price) : 0
                price = price - discount
            when "SR1"
              price = (amount >= 3 ? (4.50 * amount) : (amount * product.price))
            when "CF1"
              price = (amount >= 3 ? (product.price * amount *2/3) : (amount * product.price))
        end
        price.round(2)
    end

end