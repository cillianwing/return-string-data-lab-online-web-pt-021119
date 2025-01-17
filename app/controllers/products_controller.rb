class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :edit, :description, :inventory]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def description
    render plain: @product.description
  end

  def inventory
    if @product.inventory > 0
      render plain: 'true'
    else
      render plain: 'false'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end
