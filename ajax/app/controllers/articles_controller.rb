class ArticlesController < ApplicationController

  def index
    if params[:id]
      @articles = Article.where('id < ?', params[:id]).limit(5)
    else
      @articles = Article.limit(0)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
      @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(subject_params)
      redirect_to subjects_path
    else
      render :edit
    end
  end

  def create
    @article = Article.new(article_params)
      if @article.save
        redirect_to articles_path
      else
        render :new
      end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


  def show_article
    # @articles = Article.where(created_at: (Date.today - 7.day)..Date.today)
    @articles = Article.where('created_at BETWEEN ? AND ?', Date.today - 7.day, Date.today + 1.day)
    respond_to do |format|
      format.json { render json: @articles}
      format.js {render :action => "index" }
    end

    # @article_list = Article.all
    # render index
     # render layout: false
  end

  private def article_params
    params.require(:article).permit(:title, :body)
  end
end
