class PagesController < ApplicationController
  def home
    @products = Product.all
    @title = "- Doma"
  end

  def about
    @title = "- O nas"
  end
<<<<<<< HEAD

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
=======
>>>>>>> 0dd5afb9680728a3f1462a83ec4928dc75f3891c
end
