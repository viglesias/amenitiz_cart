class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_session_cart, only: [:add, :remove]

  def show
    @cart = Cart.new(session[:cart])
    @cart_items = @cart.get_items
  end

  def add
    @cart.add_item(params[:product_id])
    flash[:notice] = "Product added successfully"
    session[:cart] = @cart.get_items
    redirect_to products_path
  end

  def remove
    removed_item = @cart.remove_item(params[:product_id])
    session[:cart] = @cart.get_items
    flash[:notice] = removed_item ? "Product removed successfully" : "Product not found"
    redirect_to products_path
  end

  def clear
    session[:cart] = {}
    flash[:notice] = "Cart cleaned successfully"
    redirect_back fallback_location: root_path
  end

  private
    def set_session_cart
      @cart = Cart.new(session[:cart])
    end

end
