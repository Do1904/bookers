class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new  
  end
  
  def create
    new_book = Book.new(book_params)
    new_book.save
    redirect_to book_path(id: new_book.id)
    # redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    editing_book = Book.find(params[:id])
    editing_book.update(book_params)
    redirect_to book_path(editing_book.id)  
  end
  
  def destroy
    destroying_book = Book.find(params[:id])
    destroying_book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
