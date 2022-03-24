class ArticlesController < ApplicationController
  def index
    # @で始まる変数をインスタンス変数と呼ぶ
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # createアクションは、タイトルと本文を持つ新しい記事をインスタンス化し、データベースへの保存を試みます。記事の保存に成功すると、その記事のページ（"http://localhost:3000/articles/#{@article.id}"）にリダイレクトする
    # 記事の保存に失敗した場合は、app/views/articles/new.html.erbに戻ってフォームを再表示し、Turboが正常に動作するようにステータスコード422 Unprocessable Entityを返します（unprocessable_entity）

    @article = Article.new(article_params) # paramsのフィルタ適用

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    # paramsをフィルタする
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
