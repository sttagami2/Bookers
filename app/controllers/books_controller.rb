class BooksController < ApplicationController
  
  
  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
   if book.save
    redirect_to book_path(book.id)
   else
    redirect_to books_path
   end
  end

  def show
    @user = User.find(current_user.id)
    # ↑ 指定し忘れやすい
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end     

end