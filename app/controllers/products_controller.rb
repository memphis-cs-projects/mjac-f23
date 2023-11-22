class ProductsController < ApplicationController
  def index
    @products=Product.order(:name)
    render :index

  end
  def show
    @product=Product.find(params[:id])
    render :show

  end
end
