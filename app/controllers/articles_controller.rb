# frozen_string_literal: true

# articles - blog
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_categories, only: %i[new edit]

  def index
    @articles = Article.all.order(id: :desc)
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)
    @article.save_categories

    redirect_to @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # current_user.articles.new(article_params)
    @article.save_categories

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def from_author
    @user = User.find_by_id(params[:user_id])
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :content,
      category_elements: []
    ).merge(user_id: current_user.id) # optional
  end

  def set_article
    @article = Article.find_by_id(params[:id])
  end

  def set_categories
    @categories = Category.all
  end
end
