class Api::ArticlesController < Api::ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: { success: 200 }
  end

  def show
  end

  def create
    articleParams = params.require(:article).permit(:title, :body)
    tagParams = params.permit(tags: [])

    article = Article.new(articleParams)
    article.add_tags(tagParams[:tags])

    if article.save
      render json: { id: article.id }
    else
      render json: { error: 500 }
    end
  end
end
