# app/controllers/carts_controller.rb

class CartsController < ApplicationController
  before_action :find_cart_item, only: [:show, :edit, :update_quantity, :destroy, :checkout_from_cart]
  before_action :authenticate_user!


  def index
    @carts = Cart.includes(product: :user).all
    @cart = Cart.new
  end

  def show
    # @cart_item is set by the before_action
  end

  def add_to_cart
    @cart = Cart.new(cart_params)

    if @cart.save
      flash[:success] = 'New product successfully added to cart'
      redirect_to carts_url
    else
      flash.now[:error] = 'Product adding failed'
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    # @cart_item is set by the before_action
  end

  def update_quantity
    if @cart_item.update(cart_params)
      flash[:success] = 'Cart item quantity updated successfully!'
      redirect_to carts_path
    else
      flash.now[:error] = 'Failed to update cart item quantity'
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @cart = Cart.find_by(id: params[:id])

    if @cart
      @cart.destroy
      flash[:success] = 'The cart item was successfully removed'
    else
      flash[:error] = 'Cart item not found or does not exist.'
    end

    redirect_to carts_url, status: :see_other
  end

  private

  def find_cart_item
    @cart_item = Cart.find_by(id: params[:id])

    if @cart_item.nil?
      flash[:error] = 'Cart item not found or does not exist.'
      redirect_to carts_path and return
    end
  end

  def cart_params
    params.require(:cart).permit(:quantity, :product_id)
  end
\

end
