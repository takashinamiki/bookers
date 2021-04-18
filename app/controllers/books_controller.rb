class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new

  end

  def show
    @book=Book.find(params[:id])
  end

  def create
    book=Book.new(book_params)
    if book.save
      flash[:success] = "successfully created."
      redirect_to book_path(book.id)
    else
      flash[:danger] = "error title and body can't be blank."
      redirect_to books_path
    end
   
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
      if book.update(book_params)
        flash[:success] = "successfully updated."
        redirect_to book_path(book.id)
      else
        flash[:danger] = "error title and body can't be blank."
        redirect_to book_path(book.id)
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      flash[:success] = "successfully destroyed."
      redirect_to books_path
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
