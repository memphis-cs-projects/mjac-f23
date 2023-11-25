class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :creator_permission, except: [:index, :show, :new, :create]

  def creator_permission 
    @product = Product.find(params[:id])
    if current_user.admin == false
      flash[:error] = 'You are not an admin'
      redirect_to products_url
    else
      unless current_user == @product.user
        flash[:error] = 'You do not have permission to do that.'
        redirect_to products_url
      end
    end
  end

  def index
      @products=Product.order(:name)
      render :index
  end

  def show
    @product=Product.find(params[:id])
    render :show
  end

  def new 
    @product = current_user.products.build
    render :new
  end

  def create
    @product = current_user.products.build(params.require(:product).permit(:name, :description, :category, :price))

    if @product.save 
      flash['success'] = "#{@product.name} has been created!"
      redirect_to product_url(@product)
    else
      flash.now['error'] = 'Error! Unable to create product.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = current_user.products.find(params[:id])
    render :edit
  end 

  def update
    @product = current_user.products.find(params[:id])
    if @product.update(params.require(:product).permit(:name, :description, :category, :price, :supplier))
      flash['success'] = "#{@product.name} has been updated!"
      redirect_to product_url(@product)
    else
      flash.now['error'] = 'Error! Unable to update product.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:success] = "The item was successfully destroyed"
    redirect_to products_url, stats: :see_other
  end

end
