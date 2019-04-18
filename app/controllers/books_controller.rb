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
   if @book.save
      flash[:success] = "successfully"
      redirect_to book_path(@book.id)
  else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
      @books = Book.all
      @user = current_user
      @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
      @bookn = Book.new
      @user = @book.user
  end

  def edit
      @book = Book.find(params[:id])
   if @book.user.id != current_user.id
      flash[:success] = "successfully"
      redirect_to book_path(@book.id)
  end
  end

  def update
      book = Book.find(params[:id])
   if book.user.id != current_user.id
      redirect_to book_path(book.id)
   else
      book.update(book_params)
      redirect_to book_path(book.id)
  end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
  def book_params
      params.require(:book).permit(:book_name,:caption)
  end

end
