class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books.reverse_order
  end

  def index
    @users = User.all
    @user = User.find_by(id: current_user.id)
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
