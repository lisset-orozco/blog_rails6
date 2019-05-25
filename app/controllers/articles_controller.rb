# frozen_string_literal: true

# articles - blog
class ArticlesController < ApplicationController
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
    params.require(:article).permit(:title, :content)
  end
end
