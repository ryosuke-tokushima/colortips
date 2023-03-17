class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(user_id: current_user.id)
    @color_palettes = current_user.color_palettes
  end

  def create
    @post = current_user.posts.build(post_params)
    post = @post
    if post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:color_palette_id,:body, { images: [] })
  end
end
