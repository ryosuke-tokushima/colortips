class CommentsController < ApplicationController
    def create
      @comment = current_user.comments.new(comment_params)
      if @comment.save
        respond_to do |format|
          format.html { redirect_to @comment.post }
          format.js
        end
      else
        flash[:alert] = @comment.errors.full_messages.join(", ")
        redirect_back(fallback_location: root_path)
      end
    end

    # app/controllers/comments_controller.rb

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy if @comment.user == current_user
        respond_to do |format|
          format.html { redirect_back(fallback_location: root_path) }
          format.js
        end
    end
  
      

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end
