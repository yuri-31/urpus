class Public::HomesController < ApplicationController
    
    def top
        @words = Word.all
    end
    
    def about
    end
end
