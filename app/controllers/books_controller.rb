class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)        # Show.htmlの画面に移行
    else
      @books = Book.all   
      render :index                         # renderはコントローラを介さずにViewへデータを返す → 返すデータをrender前に定義すること！
  end

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end     # ← 記述忘れがち！
end