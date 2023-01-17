class Public::PagesController < ApplicationController
    before_action :authenticate_user!, except: [:show]
        
    def create
        @new_page = Page.new(page_params)
        if @new_page.save
            flash[:success] = "You have created PAGE successfully."
            redirect_to request.referer
        else
            flash[:danger] = "You failed to create new PAGE."
            redirect_to request.referer
        end
    end
    
    def show
        @page = Page.find(params[:id])
        if @page.book.is_private? && @page.book.user != current_user
            flash[:notice] = 'The BOOK is set private.'
            redirect_to books_path
        end
        @words = @page.words
        @word = Word.new
        @meanings = @word.meanings.build
        @examples = @word.examples.build
    end
    
    def edit
        @book = Book.find(params[:id])
        if @book.user != current_user
            redirect_to books_path
        end
        @pages = @book.pages
    end
    
    def update
        page = Page.find(params[:id])
        if page.book.user == current_user && page.update(page_params)
            flash[:success] = "The BOOK has been updated successfully."
            redirect_to request.referer
        else
            flash[:danger] = "Failed to update the BOOK."
            redirect_to request.referer
        end
    end
    
    def destroy
        page = Page.find(params[:id])
        if page.book.user == current_user && page.destroy
            flash[:notice] = "The PAGE has been deleted."
            redirect_to request.referer
        end
    end
    
    private
    def page_params
        params.require(:page).permit(:name, :book_id)
    end
    
    # def word_params
    #     params.require(:word).permit(:name)
    # end
end
