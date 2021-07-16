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
    session[:cart] ||= []
    if session[:cart].include? params[:product_id]
      session[:cart].delete_at(session[:cart].index(params[:product_id]) || session[:cart].length)
      flash[:notice] = "Product removed successfully"
    else
      flash[:notice] = "Product not found"
    end
    redirect_to products_path
  end

end
