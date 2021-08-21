class CategoriesController < ApplicationController
  before_action :set_parents

  def get_category_children
    @category_children = Category.find(params[:parent_id].to_s).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id].to_s).children
  end

  def menu_search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id].to_s).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id].to_s).children
        elsif params[:gcchildren_id]
          @parents = Category.where(id: params[:gcchildren_id].to_s)
        end
      end
    end
  end

  def item_search
    @category = Category.find_by(id: params[:id])

    if @category.ancestry.nil?
      category = Category.find_by(id: params[:id]).indirect_ids
      if category.empty?
        @posts = Post.where(category_id: @category.id).order(created_at: :desc)
      else
        @posts = []
        find_item(category)
      end

    elsif @category.ancestry.include?("/")
      @posts = Post.where(category_id: params[:id]).order(created_at: :desc)

    else
      category = Category.find_by(id: params[:id]).child_ids
      @posts = []
      find_item(category)
    end
  end

  def find_item(category)
    category.each do |id|
      post_array = Post.where(category_id: id).order(created_at: :desc)
      next unless post_array.present?

      post_array.each do |post|
        @posts.push(post) if post.present?
      end
    end
  end

  private

  def set_parents
    @set_parents = Category.where(ancestry: nil)
  end
end
