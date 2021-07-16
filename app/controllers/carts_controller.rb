class CartsController < ApplicationController
  def show
  end

  def add
    flash[:notice] = "Product added successfully"
    session[:cart] ||= []
    session[:cart] << params[:product_id]


    redirect_to products_path
  end

  def remove
    flash[:notice] = "Product removed successfully"
    session[:cart] ||= []
    session[:cart].delete_at(session[:cart].index(params[:product_id]) || session[:cart].length)
    redirect_to products_path
  end

end
