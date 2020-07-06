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
    @user = User.find_by(id: current_user.id)
    @book_new = Book.new
    @books = Book.all.reverse_order
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: current_user.id)
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
