class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new(user_id: current_user.id)
    @color_palettes = current_user.color_palettes
  end

  def create
    post = current_user.posts.build(post_params)
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
