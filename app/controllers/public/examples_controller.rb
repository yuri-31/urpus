class Public::ExamplesController < ApplicationController
    
    def create
        @example = Example.new(example_params)
        @example.save
        redirect_to request.referer
    end
    
    
    private
    def example_params
        params.require(:example).permit(:sentence, :word_id)
    end
end
