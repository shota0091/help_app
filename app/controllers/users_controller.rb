class UsersController < ApplicationController
  before_action :set_user
  before_action :set_rank,only: [:show,:follows,:followers]

def show
  @posts = @user.posts.order("created_at DESC").limit(4)
  @currentUserEntry = Entry.where(user_id: current_user.id)
  @userEntry = Entry.where(user_id: @user.id)
  unless @user.id == current_user.id
    @currentUserEntry.each do |cu|
      @userEntry.each do |u|
        if cu.room_id == u.room_id then
          @isRoom = true
          @roomId = cu.room_id
        end
      end
    end
    unless @isRoom
      @room = Room.new
      @entry = Entry.new
    end
  end
  @review = Review.new
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

def recruitment_index
  @posts = @user.posts
end

def follows
  user = User.find(params[:id])
  @users = user.followings.order("created_at DESC").page(params[:page]).per(20)
end

def followers
  user = User.find(params[:id])
  @users = user.followers.order("created_at DESC").page(params[:page]).per(20)
end


private
  def user_params
    params.require(:user).permit(:name, :email, :image, :address_id,:explanation)
  end

  def set_rank
    @kindness = Review.where(reviewing_id: params[:id]).average(:kindness)
    @speedy = Review.where(reviewing_id: params[:id]).average(:speedy)
    @frantically = Review.where(reviewing_id: params[:id]).average(:frantically)
    if @kindness != nil && @speedy != nil &&  @frantically != nil
      @comprehensive = (@kindness + @frantically + @speedy)
      if @comprehensive < 300 
        @rancimage = "beginner.png"
        @ranck = "ビギナー"
        @point = @comprehensive - 300
        @next = "あと#{@point.abs.floor}ポイントでブロンズランクに昇格です"  
      elsif @comprehensive < 500
        @rancimage = "copper.png"
        @ranck = "ブロンズ"
        @point = @comprehensive - 500
        @next = "あと#{@point.abs.floor}ポイントでシルバーランクに昇格です" 
      elsif @comprehensive < 700
        @rancimage = "silver.png"
        @ranck = "シルバー"
        @point = @comprehensive - 701
        @next = "あと#{@point.abs.floor}ポイントでゴールドランクに昇格です" 
      elsif @comprehensive < 1500
        @rancimage = "gold.png"
        @ranck = "ゴールド"
        @point = @comprehensive - 1500
        @next = "あと#{@point.abs.floor}ポイントでダイヤモンドランクに昇格です" 
      else
        @rancimage = "diamond.png"
        @ranck = "ダイヤモンド"
        @next = "現在#{@comprehensive.floor}ポイントです！より高みを目指しましょう"
      end
    else 
      @speedy = 0
      @kindness = 0
      @frantically = 0
      @comprehensive = @kindness + @frantically + @speedy
      if @comprehensive <= 0
        @rancimage = "beginner.png"
        @ranck = "ビギナー"
        @point = @comprehensive - 300
        @next = "あと#{@point.abs.floor}ポイントでアイアンランクに昇格です" 
      end
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
