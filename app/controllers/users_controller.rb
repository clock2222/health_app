class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @posts = Post.where(user_id: current_user.id).page(params[:page]).per(9).order(created_at: :desc)
    @statuses = Status.where(user_id: current_user.id)
    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    like_posts = Post.find(likes)
    @like_posts = Kaminari.paginate_array(like_posts).page(params[:page]).per(6)
  end

  def edit
    redirect_to user_path(@user) unless @user == current_user
  end

  def create
    redirect_to user_path(@user)
  end

  def update
    if current_user.update!(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def mypage
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:nicknamem, :avatar)
  end
end
