class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    review_i_want_to_destroy = Review.find(params[:id])
    review_owner = review_i_want_to_destroy.user_id
    if review_owner == current_user.id
      review_i_want_to_destroy.destroy
      redirect_to :back
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
