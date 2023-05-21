class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
    render json: @articles
  end

  # GET /articles/1 or /articles/1.json
  def show
    render json: @article
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # GET /articles/1/edit
  def edit
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # THE 'SET_ARTICLE' METHOD FETCHES THE APPROPRIATE ARTICLE FROM THE DB BEFORE
    # SELECTED RESTFUL ACTIONS CAN OCCUR
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
