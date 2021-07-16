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
    redirect_to products_path
  end

end
