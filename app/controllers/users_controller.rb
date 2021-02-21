class UsersController < ApplicationController
  before_action :set_user

def show
  @posts = @user.posts
  @chat = Chat.new
  @review = Review.new
  @kindness = Review.where(reviewing_id: params[:id]).average(:kindness)
  @speedy = Review.where(reviewing_id: params[:id]).average(:speedy)
  @frantically = Review.where(reviewing_id: params[:id]).average(:frantically)
  if @kindness != nil && @speedy != nil &&  @frantically != nil
    @comprehensive = (@kindness + @frantically + @speedy) / 3
  else 
    @speedy = 0
    @kindness = 0
    @frantically = 0
    @comprehensive = @kindness + @frantically + @speedy
  end

end

def eidt
  if @user.id = current_user
  else
    render users_path
  end
end

def update
  if @user.update(user_params)
    redirect_to "/users/#{current_user.id}",notice: 'ユーザー情報を更新しました'
  else
    render :edit
  end
end

private
  def user_params
    params.require(:user).permit(:name, :email, :image, :address_id,:explanation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
