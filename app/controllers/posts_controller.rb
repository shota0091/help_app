class PostsController < ApplicationController
  def index
    @tag_list = Tag.all 
    @posts = Post.all
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

  private
  def post_params
    params.require(:post).permit(:title, :explanation, :image, :license_id,:address_id,:obtain,tag_ids: []).merge(user_id: current_user.id)
  end
end
