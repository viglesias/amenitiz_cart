class ProductsController < ApplicationController

  # GET /products or /products.json
  def index
    @products = Product.all
    session[:cart] ||= []
    @cart_items_counter = session[:cart].count || 0
  end

end
