class ArticlesController < ApplicationController
  include SessionsHelper

  def index
    if logged_in? 
      @articles = Article.all
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @article = Article.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def new
    if logged_in? && admin?
      @article = Article.new
    else
      redirect_to login_path
    end
  end

  def edit
    if logged_in? && admin?
      @article = Article.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :category, :text)
    end
end
