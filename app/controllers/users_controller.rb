class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def create
    # @user = User.new(user_params)
    # post_book = 
    # if @book.save
    #   flash[:notice] = "You have created book successfully."
    #   redirect_to book_path(@book.id)        # Show.htmlの画面に移行
    # else
    #   @books = Book.all   
    #   render :index                         # renderはコントローラを介さずにViewへデータを返す → 返すデータをrender前に定義すること！
    # end
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id, :image)
  end     # ← 記述忘れがち！
end