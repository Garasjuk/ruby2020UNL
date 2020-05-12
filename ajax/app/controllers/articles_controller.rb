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
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to articles_path }
        format.js {render action: "show_article" }
        format.json { render json: @article }

        # redirect_to articles_path
      else
        format.html { render action: "edit" }

        # render :edit
      end
    end
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path }
        format.js {render action: "show_article" }
        format.json { render json: @article }
        # redirect_to articles_path
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path }
      # format.json { head :no_content }
      format.js {render action: "show_article" }
    end
    # redirect_to articles_path
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
