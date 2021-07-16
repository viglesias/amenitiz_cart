class ProductsController < ApplicationController
  before_action :set_session_cart, only: [:index]

  # GET /products or /products.json
  def index
    @products = Product.all
    @cart_items_counter = @cart.total_items
  end

  private
    def set_session_cart
      @cart = Cart.new(session[:cart])
    end

end
