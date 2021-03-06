class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    flash[:notice] = "Sucessfully Created '#{@product.name}'"
    redirect_to product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "'#{@product.name}' successfully Deleted"
    redirect_to products_path
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :image_path)
  end
end

