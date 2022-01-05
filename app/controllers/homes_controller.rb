class HomesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @pickup_posts = Post.includes(:liked_users).sort { |a, b| b.liked_users.size <=> a.liked_users.size }.first(3)
  end
end
