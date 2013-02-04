class PagesController < ApplicationController
  def home
    @products = Product.all
    @title = "- Doma"
  end

  def about
    @title = "- O nas"
  end

  def add_to_cart
    if params[:id]
      product = Product.find(params[:id])
      @cart = find_cart
      @cart.add_product(product)
    end
    respond_to do |format|
      format.html

      format.pdf do
        pdf = Prawn::Document.new

        pdf.text "Pozdravljeni"
        pdf.move_down 20
        pdf.text "Adijo"

        send_data pdf.render, filename: "Kosarica.pdf",
                  type: "application/pdf",
                  disposition: "inline" #odpre ga v novem zavihku znotraj brskalnika
      end
    end

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
