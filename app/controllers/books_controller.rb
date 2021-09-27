class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @books = Book.includes(:user).order('created_at DESC')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to root_path unless @book.user == current_user
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    redirect_to root_path if book.user_id == current_user.id && book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre_id, :thoughts, :sentence, :synopsis, :begining, :image).merge(user_id: current_user.id)
  end

end
