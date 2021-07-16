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

  it "Increments cart items counter" do
    product = Product.create(code: 'GR1', name: "Green Tea", price: 3.11)
    product2 = Product.create(code: 'SR1', name: "Strawberries", price: 5.00)
    product3 = Product.create(code: 'CF1', name: "Coffe", price: 11.23)

    visit "/products"

    expect(page).to have_content("Items in cart: 0")

    within("#product-1") do
      click_button "Add Product"
    end

    within("#product-2") do
      click_button "Add Product"
    end

    within("#product-1") do
      click_button "Add Product"
    end
    
    expect(page).to have_content("Items in cart: 3")

  end
end