class Public::PagesController < ApplicationController
    
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
        @word = Word.new
        @meanings = @word.meanings.build
        @examples = @word.examples.build
        @page = Page.find(params[:id])
        @words = @page.words
    end
    
    def edit
        @book = Book.find(params[:id])
        @pages = @book.pages
    end
    
    def update
        page = Page.find(params[:id])
        if page.update(page_params)
            flash[:success] = "The BOOK has been updated successfully."
            redirect_to request.referer
        else
            flash[:danger] = "You failed to update the BOOK."
            redirect_to request.referer
        end
    end
    
    def destroy
        page = Page.find(params[:id])
        if page.destroy
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
