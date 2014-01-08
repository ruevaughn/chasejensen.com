class Api::ArticlesController < Api::ApplicationController
  def index
    render json: { success: 200 }
  end

  def show
  end

  def create
    articleParams = params.require(:article).permit(:title, :body)
    article = Article.new(articleParams)
    if article.save
      render json: { success: 200 }
    else
      render json: { error: 500 }
    end
  end
end
