class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_admin, only: %i[index]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    @color_palettes = @user.color_palettes.includes(:colors)
    @posts = @user.posts
    @bookmarked_posts = current_user.bookmarked_posts
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :name)
  end

  def require_admin
    unless current_user.admin?
      flash[:alert] = 'You must be an admin to access this page.'
      redirect_to root_path
    end
  end
end
