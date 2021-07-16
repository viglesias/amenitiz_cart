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

end