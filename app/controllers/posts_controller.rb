class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :set_parents
  before_action :hashtag, only: %i[index]

  def index
    @posts = Post.includes(:user, :likes).order(:created_at)
  end

  def new
    @post = Post.new
    @ingredients = @post.ingredients.build
    @how_to_makes = @post.how_to_makes.build
    @graphs = @post.graphs.build
  end

  def create
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
    gon.chart_label = ["痛み", "疲労", "肥満", "不安", "不眠", "その他"]
    gon.chart_data = @post.graphs.pluck(:pain, :fatigue, :obesity, :anxiety, :insomnia, :other).flatten
    @category_id = @post.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
    @statuses = Status.where(user_id: current_user.id)
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

  def hashtag
    @user = current_user
    if params[:name].nil?
    else
      @hashtag = Hashtag.find_by(hashname: params[:name])
      @posts = @hashtag.posts.page(params[:page]).per(20).reverse_order
    end
    @hashtags = Hashtag.all.to_a.group_by { |hashtag| hashtag.posts.count }
  end

  private

  def set_post
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません" if @post.nil?
  end

  def set_parents
    @set_parents = Category.where(ancestry: nil)
  end

  def post_params
    params.require(:post).permit(:title, :image, :content, :category_id, :tag_name, :user_id,
                                 ingredients_attributes: [:id, :ing_name, :quantity, :_destroy],
                                 how_to_makes_attributes: [:id, :explanation, :_destroy],
                                 graphs_attributes: [:id, :pain, :fatigue, :obesity, :anxiety, :insomnia, :other, :_destroy])
  end
end
