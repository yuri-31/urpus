class Public::BooksController < ApplicationController
    
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
            redirect_to request.referer
        else
            @new_book = Book.new
            @books = current_user.books
            flash[:danger] = "You failed to create new BOOK."
            render :index
        end
    end

    def show
        @new_page = Page.new
        @book = Book.find(params[:id])
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
            redirect_to request.referer
        end
    end
    
    def update
        book = Book.find(params[:id])
        if book.update(book_params)
            flash[:success] = "You have updated the BOOK successfully."
            redirect_to request.referer
        else
            @books = current_user.books
            flash[:danger] = "You failed to update the BOOK."
            render :edit
        end
    end
    
    def destroy
        book = Book.find(params[:id])
        if book.destroy
            flash[:notice] = "The BOOK has been deleted."
            redirect_to request.referer
        else
            @books = current_user.books
            render :edit
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
