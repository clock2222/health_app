class LikeCommentsController < ApplicationController
  def create
    current_user.like_comments.create!(comment_id: params[:post_id])
    @comment = Comment.find(params[:post_id])
  end

  def destroy
    current_user.like_comments.find_by(comment_id: params[:post_id]).destroy!
    @comment = Comment.find(params[:post_id])
  end
end
