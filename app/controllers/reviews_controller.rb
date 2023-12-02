class ReviewsController < ApplicationController
  def new
    @review = current_user.reviews.new(product_id: params[:product_id])
    render :new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to product_path(@review.product), notice: "Review created successfully!"
    else
      render :new, alert: "Error creating review."
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :product_id, :text)
  end
end
