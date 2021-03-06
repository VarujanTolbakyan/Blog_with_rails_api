class ArticlesController < ApplicationController
  before_action :authenticate!, only: [:update, :destroy, :create]
  before_action :set_article, only: [:show, :update, :destroy]
  before_action -> { authorization!(@article) },  only: [:update, :destroy]

  # GET /articles
  def index
    @articles = ArticlesFilter.result filter_params

    render json: @articles, each_serializer: ArticlesSerializer
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    render json: { message: 'Article successful deleted' }
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:title, :body, :category)
  end

  def filter_params
    params.permit :author_id, :category
  end
end
