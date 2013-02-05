class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      @items << CartItem.new(product)
    end
  end

  def paypal_url(return_url)
    values = {
      :business => "luka.d_1359966637_biz@siol.net",
      :cmd => "_cart",
      :upload => 1,
      :return => return_url
    }
    items.each_with_index do |item, index|
       values.merge!({
         "amount_#{index+1}" => item.price,
         "item_name_#{index+1}" => item.product.name,
         "quantity_#{index+1}" => item.quantity
                     })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end
