class Admin::ProductsController < Admin::ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(params[:product])
    redirect_to admin_products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path
    else
      redirect_to edit_admin_products_path(@product)
    end

  end
end
