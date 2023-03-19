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

    if @post.save
      if params[:post][:category_names].present?
        params[:post][:category_names].split(',').each do |category_name|
          category = Category.find_or_create_by(category_name: category_name.strip.downcase)
          @post.categories << category
        end
      end 
    redirect_to root_path
    else
      render :new
    end 
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:color_palette_id,:body, { images: [] }, :category_names)
  end
end

