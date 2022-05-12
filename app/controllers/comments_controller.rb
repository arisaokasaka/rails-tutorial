class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params) # コメントと記事が自動的にリンクされ、指定された記事に対してコメントが従属する
        redirect_to article_path(@article)
    end
    
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body, :status)
        end
end
