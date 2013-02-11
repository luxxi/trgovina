# Encoding: utf-8
class PagesController < ApplicationController
  def home
    @products = Product.all
    @title = "- Doma"
  end

  def about
    @title = "- O nas"
  end

  def add_to_cart
    @cart = find_cart
    if params[:id]
      product = Product.find(params[:id])
      @cart.add_product(product)
    end
    product = Product.find(params[:id])
    @cart.add_product product unless product.nil?

    respond_to do |format|
      format.html

      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Tvoja košarica", size: 30, style: :bold
        pdf.move_down 20
        sumAll = 0
        for item in @cart.items
          sum = item.quantity * item.price
          sumAll = sumAll + sum
          pdf.text "#{item.quantity}x #{item.name} = #{sum}"
          pdf.move_down 10
        end
        pdf.text "Skupaj: #{sumAll}"

        send_data pdf.render, filename: "Kosarica.pdf",
                  type: "application/pdf",
                  disposition: "inline" #odpre ga v novem zavihku znotraj brskalnika

    end
  end
end
  private
  def find_cart
    session[:cart] ||= Cart.new # This is BAD. Only IDs to Session not whole objects!!!
  end
end
