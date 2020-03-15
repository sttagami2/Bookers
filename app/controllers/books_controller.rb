class BooksController < ApplicationController
  def create
    @book = Book.new
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
    #@book.user_id = current_user.id
    # if @book.save
    #   flash[:notice] = "You have created book successfully."
    #   redirect_to books_path(@book.id)        # Show.htmlの画面に移行
    # else
    #   @books = Book.all   
    #   render :show                         # renderはコントローラを介さずにViewへデータを返す → 返すデータをrender前に定義すること！
    # end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end