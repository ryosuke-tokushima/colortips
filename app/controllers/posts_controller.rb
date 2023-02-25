class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
    @color_palettes = current_user.color_palettes
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:color_palette, images[])
  end
end
