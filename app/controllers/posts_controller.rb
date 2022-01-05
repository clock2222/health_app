class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :hashtag, only: %i[index]

  def index
    @posts = Post.includes(:user, :likes).page(params[:page]).per(12).order(created_at: :desc)
    @tag_list = Hashtag.includes(:posts).order("char_length(hashname) asc").first(100)
  end

  def new
    @post = Post.new
    @ingredients = @post.ingredients.build
    @graphs = @post.graphs.build
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:hashname].split(/[[:blank:]]/)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to @post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.hashtags
    @comments = @post.comments
    @comment = current_user.comments.new
    @ingredients = @post.ingredients
    gon.chart_label = ["心", "身体", "睡眠", "集中力", "社会", "お金"]
    gon.chart_data = @post.graphs.pluck(:graph_a, :graph_b, :graph_c, :graph_d, :graph_e, :graph_f).flatten
    @category_id = @post.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
    @statuses = Status.where(user_id: @post.user.id)
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.hashtags.pluck(:hashname).join(" ")
  end

  def update
    tag_list = params[:post][:hashname].split(/[[:blank:]]/)
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to @post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, alert: "削除しました"
  end

  def search
    @tag_list = Hashtag.all
    @tag = Hashtag.find(params[:hashtag_id])
    @posts = @tag.posts.all
  end

  def hashtag
    @user = current_user
    unless params[:name].nil?
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

  def post_params
    params.require(:post).permit(:title, :image, :content, :category_id, :tag_name, :user_id,
                                 ingredients_attributes: [:id, :ing_name, :quantity, :explanation, :_destroy],
                                 graphs_attributes: [:id, :graph_a, :graph_b, :graph_c, :graph_d, :graph_e, :graph_f, :_destroy])
  end
end
