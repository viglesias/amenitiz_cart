class CartsController < ApplicationController
  before_action :set_session_cart, only: [:add, :remove]

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

  private
    def set_session_cart
      @cart = Cart.new(session[:cart])
    end

end
