class ArticlesController < ApplicationController

  def index
    if params[:id]
      @articles = Article.where('id < ?', params[:id]).limit(5)
    else
      @articles = Article.limit(1)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    # render js: "alert('The number is: #{params[:id]}')"
    # @article = Article.all
    respond_to  do |format|
    #   format.js {@article}
      format.js
    end
  end

  def show_article
    @articles = Article.where(created_at: (Time.now.midnight - 7.day)..Time.now.midnight)
    respond_to do |format|
      format.json { render json: @articles}
      format.js
    end

    # @article_list = Article.all
    # render index
     # render layout: false
  end

end
