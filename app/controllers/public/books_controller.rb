class Public::BooksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    
    def new
        @new_book = Book.new
        @books = current_user.books
        
        if params[:id]
            @book = Book.find(params[:id])
            @pages = @book.pages
        end
    end
    
    def create
        @new_book = Book.new(book_params)
        @new_book.user_id = current_user.id
        if @new_book.save
            flash[:success] = "You have created BOOK successfully."
            redirect_to new_book_path
        else
            @new_book = Book.new
            @books = current_user.books
            flash[:danger] = "You failed to create new BOOK."
            redirect_to new_book_path
        end
    end

    def index
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true).where(is_private: false)
        if params[:id]
            @book = Book.find(params[:id])
            @pages = @book.pages
        end
    end
    
    def show
        @new_page = Page.new
        @book = Book.find(params[:id])
        
        if @book.is_private? && @book.user != current_user
            flash[:notice] = 'The BOOK is set private.'
            redirect_to books_path
        end
        
        @pages = @book.pages
    end
    
    def edit
        @books = current_user.books
    end
    
    def update_status
        book = Book.find(params[:id])
        book.is_private = !book.is_private
        if book.save
            flash[:success] = "BOOK status has been updated successfully."
            redirect_to edit_books_path
        end
    end
    
    def update
        book = Book.find(params[:id])
        if book.user == current_user && book.update(book_params)
            flash[:success] = "You have updated the BOOK successfully."
            redirect_to edit_books_path
        else
            @books = current_user.books
            flash[:error] = book.errors.full_messages
            redirect_to request.referer
        end
    end
    
    def destroy
        book = Book.find(params[:id])
        if book.user == current_user && book.destroy
            flash[:notice] = "The BOOK has been deleted."
            redirect_to edit_books_path
        else
            @books = current_user.books
            render :edit
        end
    end
    
    
    
    private
    def book_params
        params.require(:book).permit(:name)
    end
    
    def book_status_params
        params.require(:book).permit(:is_private)
    end
    
    def page_params
        params.require(:page).permit(:name)
    end
        
end
