require 'rails_helper'

RSpec.describe "When a user adds a product to the cart" do
  it "displays a message" do
    product = Product.create(code: 'GR1', name: "Green Tea", price: 3.11)

    visit "/products"

    within("#product-#{product.id}") do
      click_button "Add Product"
    end

    expect(page).to have_content("Product added successfully")
  end
end