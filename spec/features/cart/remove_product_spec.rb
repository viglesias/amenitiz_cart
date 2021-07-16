RSpec.describe "When a user remove a product from the cart" do
    it "displays a message" do
        product = Product.create(code: 'GR1', name: "Green Tea", price: 3.11)

        visit "/products"

        within("#product-#{product.id}") do
        click_button "Remove Product"
        end

        expect(page).to have_content("Product removed successfully")
    end
end