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
    category_list = params[:post][:category_name].split(',')
    if @post.save
      @post.save_category(category_list)
      redirect_to root_path(@post), success: 'ポストを作成しました'
    else
      render :new
    end 
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @category_list = @post.categories.pluck(:category_name).join(',')
  end

  def update
    @post = current_user.posts.find(params[:id])
    category_list = params[:post][:category_name].delete(" ").split(",")
    if @post.update(post_params)
      @post.save_category(category_list)
      redirect_to post_path(@post), success: '投稿を編集しました'
    else
      flash.now['danger'] = '編集に失敗しました'
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:color_palette_id,:body, { images: [] }, :category_names)
  end
end

