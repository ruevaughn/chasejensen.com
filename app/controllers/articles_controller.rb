class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def show
  end

  def create
    article = params[:article]
    if article.save
      render json: { success: 200 }
    else
      render json: { error: 500 }
    end
  end
end
