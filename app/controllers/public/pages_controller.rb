class Public::PagesController < ApplicationController
    
    def create
        @new_page = Page.new(page_params)
        @new_page.save
        redirect_to request.referer
    end
    
    private
    def page_params
        params.require(:page).permit(:name, :book_id)
    end
end
