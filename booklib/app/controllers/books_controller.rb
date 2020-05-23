class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def get_current_user
      @current_user ||= User.find(session[:id]) if session[:id]
      render json: @current_user
  end

  def get_choice
      @choice ||= Choice.all
      render json: @choice
  end
  
  def show
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      # head :no_content, status: :ok
    else
      # render json: @book.errors, status: :unprocessable_entity
    end
  end

  def create
      # render plain: params[:library].inspect
    @books = Book.create(book_params)
    if @books.save
      render json: @books
    else

    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author)
    end

end
