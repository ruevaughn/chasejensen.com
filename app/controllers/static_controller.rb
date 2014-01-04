class StaticController < ApplicationController
  def home
  end

  def portfolio
  end

  def blog
    @search = Search.new
  end
end
