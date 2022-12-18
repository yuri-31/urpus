class Public::WordsController < ApplicationController
    
# Posting to three columns at a time via public/words#create
    def create
        @word = Word.new(word_params)
        if @word.save
          redirect_to request.referer
        else
          redirect_to root_path
        end
        
        # meaning = Meaning.new(meaning_params)
        # meaning.word_id = @word.id
        # meaning.content = params[:word][:content]
        # meaning.save
        
        # example = Example.new(example_params)
        # example.word_id = @word.id
        # example.sentence = params[:word][:sentence]
        # example.save
        
        # redirect_to request.referer
    end
    
    def index
        @words = current_user.words.order("name")
    end
    
    def edit
        @word = Word.find(params[:id])
        
        @meaning = Meaning.new
        @meanings = @word.meanings
        @add_meanings = @word.meanings.build
        
        @example = Example.new
        @examples = @word.examples
        @add_examples = @word.examples.build
    end
    
    def update
        @word = Word.find(params[:id])
        @word.update(word_params)
        redirect_to page_path(@word.page_id)
    end
    
    def update_status
        @word = Word.find(params[:id])
        @word.is_learnt = !@word.is_learnt
        @word.save
        redirect_to request.referer
    end
    
    def destroy
        word = Word.find(params[:id])
        word.destroy
        redirect_to request.referer
    end
    
    private
    def word_params
        params.require(:word).permit(:page_id, :user_id, :form, :name, meanings_attributes:[:id, :content, :_destroy], examples_attributes:[:id, :sentence, :_destroy])
    end
    
    # def meaning_params
    #     params.require(:word).permit(:content)
    # end
    # def example_params
    #     params.require(:word).permit(:sentence)
    # end
end
