class Admin::PostsController < Admin::BaseController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy!
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:color_palette_id, :body, { images: [] }, :category_names)
  end
end
