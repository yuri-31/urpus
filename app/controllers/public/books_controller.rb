class Public::BooksController < ApplicationController
    
    def index
        @new_book = Book.new
        @books = current_user.books
        
        # if params[:book][:id]
        #     @book = Book.find(params[:id])
        #     @pages = @book.pages
        # end
    end
    
    def create
        @new_book = Book.new(book_params)
        @new_book.user_id = current_user.id
        @new_book.save
        redirect_to request.referer
    end
    
    
    private
    def book_params
        params.require(:book).permit(:name)
    end
        
end
