class UsersController < ApplicationController
  def show
  end


  def get_book_by_user
    # Author.joins("INNER JOIN posts ON posts.author_id = authors.id AND posts.published = 't'")
    # @books = Book.all
    @books = Choice.joins(:book).select(' title as title, author as author').where(id_user: session[:id])
    render json: @books
  end

  def get_choice_by_user
      @choice ||= Choice.where(id_user: session[:id]) if session[:id]
      render json: @choice
  end
end
