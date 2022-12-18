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
    
    
    private
    def page_params
        params.require(:page).permit(:name, :book_id)
    end
    
    # def word_params
    #     params.require(:word).permit(:name)
    # end
end
