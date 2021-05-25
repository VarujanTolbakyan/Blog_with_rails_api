class CommentsController < ApplicationController
  before_action :authenticate!, only: [:create, :update, :destroy]
  before_action :set_article, except: :index
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action -> { authorization!(@comment) },  only: [:update, :destroy]

  # GET /articles/1/comments
  def index
    @comments = CommentFilter.result filter_params

    render json: @comments
  end

  # GET /articles/1/comments/1
  def show
    render json: @comment
  end

  # POST /articles/1/comments
  def create
    @comment = current_user.comments
      .build(comment_params.merge(article_id: params[:article_id]))

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1/comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1/comments/1
  def destroy
    @comment.destroy
    { message: 'Comment successful deleted' }
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def filter_params
    params.permit :commenter_id, :article_id
  end
end
