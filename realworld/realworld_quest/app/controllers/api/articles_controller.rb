class Api::ArticlesController < ApplicationController
  before_action :authorize, only: [:create, :show, :update, :destroy]

  def index
    @articles = Article.all
    render json: @articles  
  end

  def create
    @article = Article.create(article_params)
    @article.slug = generate_slug(@article.title)
    if @article.valid?
      render json: @article, status: :created
    else
      render json: {error: "Invalid article"}, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find_by(slug: params[:slug])
    if @article
      render json: @article
    else
      render json: {error: 'Article not found'}, status: :not_found
    end
  end
  
  def update
    @article = Article.find_by(slug: params[:slug])
    if @article.update(article_params)
      render json: @article
    else
      render json: {error: "Invalid article"}, status: :unprocessable_entity
    end
  end
  
  def destroy
    @article = Article.find_by(slug: params[:slug])
    @article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end
  
  def generate_slug(title)
    title.parameterize  
  end

end
