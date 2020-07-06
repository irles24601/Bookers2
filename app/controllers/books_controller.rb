class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(@book.user_id), notice: 'You have created sucessfully.'
  end

  def index
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
