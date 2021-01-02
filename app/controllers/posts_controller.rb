class PostsController < ApplicationController
  before_action :set_post,only: [:show, :destroy,:edit,:update]
  
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @tag_lists = @post.tags.pluck(:tag_name).join(' ')
  end

  def update
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update_attributes(post_params)
      @post.save_tag(tag_list)
      redirect_to posts_path
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :explanation, :image, :license_id,:address_id,:obtain,tag_ids: []).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
