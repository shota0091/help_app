class LikesController < ApplicationController

  def create
    @like = current_user.active_follows.build(follower_id: params[:user_id])
    if @like.save
        redirect_to user_path(@like.follower_id)
    else
      render :show
    end
  end

  def destroy
    @like = current_user.active_follows.find_by(follower_id: params[:user_id])
    @like.destroy
    redirect_to user_path(@like.follower_id)
  end
end
