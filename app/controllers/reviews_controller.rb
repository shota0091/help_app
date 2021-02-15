class ReviewsController < ApplicationController

  def create
    review = current_user.active_reviews.build(reviewer_id: params[:user:id],:speedy, :kindness, :frantically)
   if @review.save
    redirect_to users_path
  else
    redirect_to root_path
  end
end
