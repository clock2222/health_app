class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:post_id])
    redirect_to root_path, alert: "権限がありません" if @comment.nil?
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
