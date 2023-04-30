class Admin::ColorsController < Admin::BaseController
  def index
    @q = Color.ransack(params[:q])
    @colors = @q.result(distinct: true).order(created_at: :desc)
  end

  def show
    @color = Color.find(params[:id])
  end
end
