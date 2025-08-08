module Admin
  class DashboardController < ApplicationController
    def index
      @posts_count = Post.count
      @recent_posts = Post.order(created_at: :desc).limit(10)
    end
  end
end


