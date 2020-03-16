class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
    #@user = current_user でも良い
    @book = Book.new
    @books = Book.all
  end

 
  def show
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
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
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end     # ← 記述忘れがち！
end