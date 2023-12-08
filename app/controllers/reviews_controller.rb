class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.new(product: @product)

    render :new
  end

  def edit
    @review = Review.find(params[:id])

    render :edit
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to item_path(@review.product), notice: "Review updated successfully!"
    else
      render :edit
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.find_by(product_id: params[:product_id])

    if @review.nil?
      @review = current_user.reviews.new(review_params)

      if @review.save
        redirect_to item_path(@review.product), notice: "Review created successfully!"
      end
    else
      flash[:error] = 'You already wrote a review'
      redirect_to item_path(@review.product), status: :unprocessable_entity
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
      flash[:error] = "You don't have permission to delete this review."
      redirect_to item_path(@review.product), status: :see_other
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :product_id, :text, :rating)
  end
end
