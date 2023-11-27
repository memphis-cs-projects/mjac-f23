class ItemsController < ApplicationController

    def index
        @products = Product.all # Fetch all products by default
    
        # Filter by category if 'category' parameter is present
        @products = @products.where(category: params[:category]) if params[:category].present?
        @products = @products.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
    
        # Sort by price if 'price' parameter is present
        if params[:price] == 'asc'
          @products = @products.order(price: :asc)
        elsif params[:price] == 'desc'
          @products = @products.order(price: :desc)
        end
      end

    def show
        @product = Product.find(params[:id])
        render :show
    end

end
