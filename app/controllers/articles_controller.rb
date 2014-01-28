class ArticlesController < ApplicationController
  # TODO: Replace and change
  http_basic_authenticate_with name: 'chase', password: 'chaskins182',
    except: [:show, :index]

  def new
    @article = Article.new
  end

  def index
  end

  def show
    @article = Article.find(params[:id])
  end

end
