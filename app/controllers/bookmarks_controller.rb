class BookmarksController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    current_user.bookmark(@post)
  end

  def destroy
    @post = current_user.bookmarks.find(params[:id]).post
    current_user.unbookmark(@post)
  end

  def bookmarked
    @bookmarked_posts = current_user.bookmarked_posts.includes(:user).order(created_at: :desc)
  end 
end
