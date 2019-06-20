class ProductsController < ApplicationController

  def index
  @products = Product.all
end

def show
  @product = Product.find(params[:id])
end

def new
  @product = Product.new
end

def create
  @product = Product.create(product_params)
  @product.save
  redirect_to product_path(@product)
end

  def body
    product = Product.find(params[:id])
    render plain: product.description
  end

  def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end
end
