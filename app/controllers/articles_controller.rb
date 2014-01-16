class ArticlesController < ApplicationController
  before_filter :authorize, only: [:new, :edit]

  def index
    @articles = Article.order(updated_at: :desc).limit(25)
  end

  def show
    @article = Article.find(params[:id])
    @article_categories = @article.categories.order(name: :asc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'New Article added!'
    else
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(article_params)
    if @article.save
      redirect_to @article, notice: 'Article successfully updated!'
    else
      render 'edit'
    end
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :content, :category_ids => [])
    end
  
end
