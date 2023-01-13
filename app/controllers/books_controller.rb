class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new  
  end
  
  def create
    @book = Book.new(book_params)
    # redirect_to '/books'
    if @book.save
      flash[:success] = 'New book added successfully'
      redirect_to book_path(id: @book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @editing_book = Book.find(params[:id])
  end
  
  def update
    @editing_book = Book.find(params[:id])
    
    if @editing_book.update(book_params)
      flash[:success] = 'The book edited successfully'
      redirect_to book_path(@editing_book.id) 
    else
      
      render :edit
    end
    
     
  end
  
  def destroy
    destroying_book = Book.find(params[:id])
    if destroying_book.destroy
      flash[:success] = 'The book deleted successfully'
      redirect_to books_path 
    else
      
      render :index
    end
    
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
