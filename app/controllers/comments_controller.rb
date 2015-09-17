class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :set_article, only: [:create]

  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

  def create
    @comment = @article.comments.create(comment_params)

    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      redirect_to @article, alert: 'Errors occured...'
    end
  end

  def destroy
    article = @comment.article

    @comment.destroy

    redirect_to article, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
