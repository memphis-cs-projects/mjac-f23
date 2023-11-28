class WishlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wishlist_item, only: [:show, :edit, :update]

  def index
    @wishlists = WishlistItem.all
    @wishlist_item = WishlistItem.new
  end



  def show
    # @wishlist_item is set by the before_action
  end

  def create
    @wishlist_item = WishlistItem.new(wishlist_item_params)

    if @wishlist_item.save
      flash[:success] = 'New wishlist item successfully added!'
      redirect_to wishlists_url
    else
      flash.now[:error] = 'Wishlist item creation failed'
      @wishlists = WishlistItem.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    # @wishlist_item is set by the before_action
  end

  def update
    puts "=== Debugging Update Action ==="
    puts "Params: #{params.inspect}"
    puts "Wishlist Item (Before Update): #{@wishlist_item.inspect}"

    if @wishlist_item.update(wishlist_item_params)
      puts "Wishlist Item (After Update): #{@wishlist_item.inspect}"
      flash[:success] = 'Wishlist item updated successfully!'
      respond_to do |format|
        format.html { redirect_to wishlists_path }
        format.js   # Add this block if you want to handle JavaScript requests
      end
    else
      flash.now[:error] = 'Failed to update wishlist item'
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy
    flash[:success] = 'The wishlist item was successfully destroyed.'
    redirect_to wishlists_url, status: :see_other
  end


  private

  def find_wishlist_item
    @wishlist_item = WishlistItem.find_by(id: params[:id])

    if @wishlist_item.nil?
      flash[:error] = 'Wishlist item not found or does not exist.'
      redirect_to wishlists_path
    end
  end

  def wishlist_item_params
    params.require(:wishlist_item).permit( :product_id)
  end
end
