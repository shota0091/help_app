class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to "/user/#{@review.user.id}"
    else
      render :show
    end
  end

  private
  def review_params
    params.require(:review).permit(:speedy, :kindness, :frantically).merge(reviewer_id: current_user.id, reviewing_id: params[:user_id])
  end
end