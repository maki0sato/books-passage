class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :search_genre_book, only: [:index, :category, :hashtag, :search]

  def index
    @books = Book.includes(:user).order('created_at DESC')
    if user_signed_in?
      @fbooks = Book.where(user_id: current_user.following_ids).order('created_at DESC')
    end
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
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
    @like = Like.new
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

  def search
    @books = Book.search(params[:keyword])
    @books_author = Book.select(:author).distinct
    @books_title = Book.select(:title).distinct
  end

  def genre
    @books = @q.result
    genre_id = params[:q][:genre_id_eq]
    @genre = Genre.find_by(id: genre_id)
  private

  def book_params
    params.require(:book).permit(:title, :author, :genre_id, :thoughts, :sentence, :synopsis, :begining, :image).merge(user_id: current_user.id)
  end

  def search_genre_book
    @q = Book.ransack(params[:q])
  end

end
