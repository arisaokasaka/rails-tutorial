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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy()

    redirect_to root_path, status: :see_other
  end

  private
    # paramsをフィルタする
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
