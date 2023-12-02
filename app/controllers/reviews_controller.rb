class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.new(product: @product)
  end

  def create
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.new(review_params)

    if @review.save
      redirect_to item_path(@review.product), notice: "Review created successfully!"
    else
      render :new, alert: "Error creating review."
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.review.find(params[:id])

    if current_user == @review.user
      @review.destroy
      flash[:success] = "Review deleted successfully"
      redirect_to item_path(@review.product), status: :see_other
    else
      redirect_to item_path(@review.product), notice: "You don't have permission to delete this review.", status: :see_other
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :product_id, :text)
  end
end
