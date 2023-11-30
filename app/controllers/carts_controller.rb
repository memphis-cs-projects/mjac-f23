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
    existing_cart_item = Cart.find_by(product_id: cart_params[:product_id], user_id: current_user.id)

    if existing_cart_item
      existing_cart_item.quantity += cart_params[:quantity].to_i
      if existing_cart_item.save
        flash[:success] = 'Cart item quantity updated successfully!'
      else
        flash[:error] = 'Failed to update cart item quantity'
      end
    else
      @cart = Cart.new(cart_params)
      @cart.user_id = current_user.id  # Set the user_id for the cart
      if @cart.save
        flash[:success] = 'New product successfully added to cart'
      else
        flash[:error] = 'Product adding failed'
      end
    end

    redirect_to carts_url
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


end
