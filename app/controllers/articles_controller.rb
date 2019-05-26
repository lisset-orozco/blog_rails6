# frozen_string_literal: true

# articles - blog
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @articles = Article.all
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)

    redirect_to @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :content
    )
  end

  def set_article
    @article = Article.find_by_id(params[:id])
  end
end
