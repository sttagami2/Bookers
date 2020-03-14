class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)        # Show.htmlの画面に移行
    else
      @books = Book.all   
      render :index                         # renderはコントローラを介さずにViewへデータを返す → 返すデータをrender前に定義すること！
    end
  end

  def show
    
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end     # ← 記述忘れがち！
end