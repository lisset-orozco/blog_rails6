# frozen_string_literal: true

# articles - blog
class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def index
    render json: Article.all
  end

  def show; end

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
