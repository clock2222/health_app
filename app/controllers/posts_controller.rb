class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.includes(:user, :likes).order(:created_at)
  end

  def new
    @post = Post.new
    @ingredients = @post.ingredients.build
    @how_to_makes = @post.how_to_makes.build
  end

  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @ingredients = @post.ingredients
    @how_to_makes = @post.how_to_makes
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update!(post_params)
      redirect_to @post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  private

  def set_post
    # @post = Post.find(params[:id])
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません" if @post.nil?
  end

  def post_params
    params.require(:post).permit(:title, :image, :content,
                                 ingredients_attributes: [:id, :ing_name, :quantity, :_destroy],
                                 how_to_makes_attributes: [:id, :explanation, :_destroy])
  end
end
