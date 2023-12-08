class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.includes(:products).all
    render :index
  end

  def show
    @order = current_user.orders.find(params[:id])
    render :show
  end

  def create
    @product = Product.find(params[:product_id])  # Use :product_id instead of :id
    @order = current_user.orders.create

    @order.products << @product
    redirect_to orders_path, notice: 'Order was successfully created.'
  end
  def destroy
    @order = Order.find(params[:id])

    # Destroy associated return
    @order.return&.destroy

    # Destroy the order
    @order.destroy

    redirect_to orders_path, notice: 'Order was successfully destroyed.'
  end

  def create_from_cart
    puts "Cart Items Params: #{params[:cart_items]}"
    @order = current_user.orders.create

    # Assuming you have a 'product_id' column in your Cart table
    cart_items = Cart.where(user_id: current_user)
    @order.products << cart_items.map(&:product)

    @order.products.each do |product|
      Reviewable.create(user: current_user, product: product)
    end

    cart_items.destroy_all

    redirect_to orders_path, notice: 'Order was successfully created from the cart.'
  end
end
