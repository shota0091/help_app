class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to users_path
    else
      render root_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:speedy, :kindness, :frantically).merge(reviewing: current_user.id,reviewer: params[:user_id])
  end
end
