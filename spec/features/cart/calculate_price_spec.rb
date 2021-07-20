RSpec.describe "Calculate prices with discounts" do

    it "When cart has one Green Tea price must be 3.11€" do 
        Product.create(code: 'GR1', name: "Green Tea", price: 3.11)
        Product.create(code: 'SR1', name: "Strawberries", price: 5.00)
        Product.create(code: 'CF1', name: "Coffe", price: 11.23)
        cart = Cart.new({"GR1": 1, "SR1": 0, "CF1": 0})
        expect(cart.total_price).to eq 3.11
    end

    it "When cart has two Green Tea there is a discount and price must be 3.11€" do 
        Product.create(code: 'GR1', name: "Green Tea", price: 3.11)
        Product.create(code: 'SR1', name: "Strawberries", price: 5.00)
        Product.create(code: 'CF1', name: "Coffe", price: 11.23)
        cart = Cart.new({"GR1": 2, "SR1": 0, "CF1": 0})
        expect(cart.total_price).to eq 3.11
    end

    it "When cart has three Green Tea there is a discount and price must be 6.22€" do 
        Product.create(code: 'GR1', name: "Green Tea", price: 3.11)
        Product.create(code: 'SR1', name: "Strawberries", price: 5.00)
        Product.create(code: 'CF1', name: "Coffe", price: 11.23)
        cart = Cart.new({"GR1": 3, "SR1": 0, "CF1": 0})
        expect(cart.total_price).to eq 6.22
    end

    it "When cart has one Strawberry price must be 5.00" do 
        Product.create(code: 'GR1', name: "Green Tea", price: 3.11)
        Product.create(code: 'SR1', name: "Strawberries", price: 5.00)
        Product.create(code: 'CF1', name: "Coffe", price: 11.23)
        cart = Cart.new({"GR1": 0, "SR1": 1, "CF1": 0})
        expect(cart.total_price).to eq 5.00
    end

    it "When cart has four Strawberries price must be 18.00€" do
        Product.create(code: 'GR1', name: "Green Tea", price: 3.11)
        Product.create(code: 'SR1', name: "Strawberries", price: 5.00)
        Product.create(code: 'CF1', name: "Coffe", price: 11.23)
        cart = Cart.new({"GR1": 0, "SR1": 4, "CF1": 0})
        expect(cart.total_price).to eq 18.00
    end

    it "When cart has one Green Tea and three strawberries price must be 16.61€" do 
        Product.create(code: 'GR1', name: "Green Tea", price: 3.11)
        Product.create(code: 'SR1', name: "Strawberries", price: 5.00)
        Product.create(code: 'CF1', name: "Coffe", price: 11.23)
        cart = Cart.new({"GR1": 1, "SR1": 3, "CF1": 0})
        expect(cart.total_price).to eq 16.61
    end

end