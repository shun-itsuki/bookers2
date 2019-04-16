class BooksController < ApplicationController

  def home
      @book = Book.new
  end

  def about

  end

  def new
      @book = Book.new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @book.save
      # redirect to
  end

  def index
      @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end

  def edit

  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      # redirect to
  end

  private
  def book_params
      params.require(:book).permit(:book_name,:captions)
  end

end
