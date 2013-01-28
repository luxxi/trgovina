class PagesController < ApplicationController
  def home
    @products = Product.all
    @title = "- Doma"
  end

  def about
    @title = "- O nas"
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
  end

  private
  def find_cart
    unless session[:cart]
      session[:cart] = Cart.new
    end
    session[:cart]

    #session[:cart] ||= Cart.new
  end
end
