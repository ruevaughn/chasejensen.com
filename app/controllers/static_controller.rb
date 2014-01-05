class StaticController < ApplicationController
  def home
  end

  def portfolio
  end

  def blog
    @search = Search.new
    @blog_posts = Article.all
  end
end
