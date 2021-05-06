class LikesController < ApplicationController

  def create
    @like = current_user.active_follows.build(follower_id: params[:user_id])
    @user = User.find(params[:user_id])
    current_user.followers
    if @like.save
      redirect_to user_path(@like.follower_id)
      @user.create_notification_follow!(current_user)
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
