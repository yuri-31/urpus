class Public::PagesController < ApplicationController
    
    def create
        @new_page = Page.new(page_params)
        @new_page.save
        redirect_to request.referer
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
        page.update(page_params)
        redirect_to request.referer
    end
    
    def destroy
        page = Page.find(params[:id])
        page.destroy
        redirect_to request.referer
    end
    
    private
    def page_params
        params.require(:page).permit(:name, :book_id)
    end
    
    # def word_params
    #     params.require(:word).permit(:name)
    # end
end
