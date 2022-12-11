class Public::WordsController < ApplicationController
    
# Posting to three columns at a time via public/words#create
    def create
        @word = Word.new(word_params)
        @word.save
        
        meaning = Meaning.new(meaning_params)
        meaning.word_id = @word.id
        meaning.content = params[:word][:content]
        meaning.save
        
        example = Example.new(example_params)
        example.word_id = @word.id
        example.sentence = params[:word][:sentence]
        example.save
        
        redirect_to request.referer
    end
    
    
    private
    def word_params
        params.require(:word).permit(:page_id, :form, :name)
    end
    
    def meaning_params
        params.require(:word).permit(:content)
    end
    def example_params
        params.require(:word).permit(:sentence)
    end
end
