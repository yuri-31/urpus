class Public::MeaningsController < ApplicationController
    
    def create
        @meaning = Meaning.new(meaning_params)
        @meaning.save
        redirect_to request.referer
    end
    
    private
    def meaning_params
        params.require(:meaning).permit(:content, :word_id)
    end
end
