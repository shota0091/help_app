class LikesController < ApplicationController

  def create
    @like = Like.create(likew_params)
    if @review.save
      redirect_to "/user/#{@like.user.id}"
    else
      render :show
    end
  end

  def destroy
    @like.destroy
    redirect_to "/user/#{@like.user.id}"
  end

  private
  def like_params
    params.require(:like).permit().merge(follower_id: current_user.id, following_id: params[:user_id])
  end
end
end
