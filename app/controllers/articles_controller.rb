class ArticlesController < ApplicationController
  def index
    # @で始まる変数をインスタンス変数と呼ぶ
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
